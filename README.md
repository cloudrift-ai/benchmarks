# Benchmarks

A tool for comparing AI model providers and their performance across different endpoints.

## Setup Instructions

1. **Clone the vLLM repository**
   ```bash
   git clone git@github.com:vllm-project/vllm.git
   ```

2. **Create a virtual environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install vLLM**
   ```bash
   VLLM_USE_PRECOMPILED=1 pip install --editable vllm
   ```

4. **Configure API keys**
   Create accounts on the providers you want to test and add API keys to the corresponding CSV files.

5. **Select model configuration**
   Different providers may use different names for the same model and have varying API endpoint formats. Use a CSV file corresponding to the model you want to test.

6. **Run the benchmark script**
   ```bash
   ./compare_providers.sh 10 1 providers.csv meta-llama/Llama-4-Maverick-17B-128E-Instruct
   ```

