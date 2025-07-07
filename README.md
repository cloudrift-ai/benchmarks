# benchmarks

1. Checkout llm repo
```bash
git clone git@github.com:vllm-project/vllm.git
```

2. create virtualenv
```bash
python3 -m venv venv
source venv/bin/activate
```
3. Install vllm
``` bash
VLLM_USE_PRECOMPILED=1 pip install --editable vllm
```

4. Create accounts on the providers you want to test and add api-keys into the corresponding scv files

5. Different providers can use different names for the same model and formats of api endpoints can be a bit different. Use a csv file corresponting to a model you want to test
5. Run script:
```bash
./compare_providers.sh 10 1 providers.csv meta-llama/Llama-4-Maverick-17B-128E-Instruct
```

