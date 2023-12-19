# opc-docs-GPT: An on device LLM for querying openshift documentation 🌐

**opc-docs-GPT** is trained on open-source LLMs that allows you to converse with openshift-docs providing a ChatGPT kind of experience for openshift docs

Note: This is a very early stage POC hence it may hallucinate sometimes and not provide completely accurate results. It is limited by training data and available open-source LLMs.

## Technical Details 🛠️
By selecting the right local models and the power of `LangChain` we are running the entire RAG pipeline locally, without any data leaving the local environment, and with reasonable performance.

- `ingest.py` uses `LangChain` tools to parse the document and create embeddings locally using `InstructorEmbeddings`. It then stores the result in a local vector database using `Chroma` vector store.
- `run_localGPT.py` uses a local LLM to understand questions and create answers. The context for the answers is extracted from the local vector store using a similarity search to locate the right piece of context from the docs.
- You can replace this local LLM with any other LLM from the HuggingFace. Make sure whatever LLM you select is in the HF format.

This project was inspired by the original [privateGPT](https://github.com/imartinez/privateGPT).

Note: Right now, This project has been configured to run on Apple Silicon (M1//M2) only.

## Architecture 
![architecture diagram](https://github.com/ayushsatyam146/opc-docs-gpt/assets/55888723/ac99b232-d154-4209-b2c4-b56e8300e011)


## Built Using 🧩
- [LangChain](https://github.com/hwchase17/langchain)
- [HuggingFace LLMs](https://huggingface.co/models)
- [InstructorEmbeddings](https://instructor-embedding.github.io/)
- [LLAMACPP](https://github.com/abetlen/llama-cpp-python)
- [ChromaDB](https://www.trychroma.com/)
- [Streamlit](https://streamlit.io/)

# Project Setup 🌍

1. 📥 Clone the repo using git:

```shell
git clone https://github.com/ayushsatyam146/opc-docs-gpt.git
```

2. 🐍 Install [conda](https://www.anaconda.com/download) for virtual environment management. Create and activate a new virtual environment.

```shell
conda create -n opc-docs-GPT python=3.10.0
conda activate opc-docs-GPT
```

3. 🛠️ Install the dependencies using pip

To set up your environment to run the code, first install all requirements:

```shell
pip install -r requirements.txt
```

***Installing LLAMA-CPP :***

It uses [LlamaCpp-Python](https://github.com/abetlen/llama-cpp-python) for GGML (you will need llama-cpp-python <=0.1.76) and GGUF (llama-cpp-python >=0.1.83) models.


If you want to use BLAS or Metal with [llama-cpp](https://github.com/abetlen/llama-cpp-python#installation-with-openblas--cublas--clblast--metal) you can set appropriate flags:


```shell
# Example: METAL
CMAKE_ARGS="-DLLAMA_METAL=on"  FORCE_CMAKE=1 pip install llama-cpp-python==0.1.83 --no-cache-dir
```
For more details, please refer to [llama-cpp](https://github.com/abetlen/llama-cpp-python#installation-with-openblas--cublas--clblast--metal)


## Test dataset

For testing, this repository contains all files in `SOURCE_DOCUMENTS` which has been sourced from [openshift-docs](https://github.com/openshift/openshift-docs) github repository

### Ingest

```sh
python ingest.py --device_type mps
```

Use help for a full list of supported devices.

```sh
python ingest.py --help
```

This will create a new folder called `DB` and use it for the newly created vector store. 

Note: When you run this for the first time, it will need internet access to download the embedding model (default: `Instructor Embedding`). In the subsequent runs, no data will leave your local environment and you can ingest data without internet connection.

## Ask questions to opc-docs-GPT

In order to chat with the *opc-docs-GPT* run the following command

```shell
python run_localGPT.py --device_type mps # to run on Apple silicon
```

This will load the ingested vector store and embedding model. You will be presented with a prompt:

```shell
> Enter a query:
```


Type `exit` to finish the script.

### Extra Options with run_localGPT.py

You can use the `--show_sources` flag with `run_localGPT.py` to show which chunks were retrieved by the embedding model. 

```shell
python run_localGPT.py --show_sources
```
