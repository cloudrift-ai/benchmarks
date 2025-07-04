#!/bin/bash

# ./run_benchmark.sh 1000 10 providers.csv


# Check if required arguments are provided
if [ $# -ne 4 ]; then
    echo "Usage: $0 <num-prompts> <max-concurrency> <providers-csv-file> <tokenizer-model>"
    echo "Example: $0 1000 10 providers.csv meta-llama/Llama-4-Maverick-17B-128E-Instruct"
    exit 1
fi

NUM_PROMPTS=$1
MAX_CONCURRENCY=$2
PROVIDERS_CSV=$3
TOKENIZER_MODEL=$4

# Check if the CSV file exists
if [ ! -f "$PROVIDERS_CSV" ]; then
    echo "Error: Providers CSV file not found: $PROVIDERS_CSV"
    exit 1
fi

# Read the CSV file and run benchmarks for each provider
while IFS=, read -r base_url endpoint model api_key; do
    if [ -z "$base_url" ]; then
        continue
    fi
    
    echo "Running benchmark for provider:"
    echo "Base URL: $base_url"
    echo "Endpoint: $endpoint"
    echo "Model: $model"

    export OPENAI_API_KEY="$api_key"
    
    # Run the benchmark_serving script
    python benchmark_serving.py \
        --backend openai-chat \
        --base-url "$base_url" \
        --endpoint "$endpoint" \
        --model "$model" \
        --tokenizer "$TOKENIZER_MODEL" \
        --num-prompts "$NUM_PROMPTS" \
        --max-concurrency "$MAX_CONCURRENCY" \
        --dataset-name random \
        --random-input-len 1000 \
        --random-output-len 5000 \
        --percentile_metrics ttft,tpot,itl,e2el
    
    echo "Benchmark completed for this provider"
    echo "----------------------------------------"
done < "$PROVIDERS_CSV"