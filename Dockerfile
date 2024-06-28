FROM python:3.9

ADD src /app

WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install langchain-community langchain-core langchain-huggingface chromadb 

ENV OLLAMA_API_ENDPOINT=http://localhost:11434/api/generate
ENV PDF_FOLDER=pdf
ENV CHROMA_DB_DIR=./chroma_db
ENV TURN_LIMIT=10

EXPOSE 8501

CMD ["streamlit", "run", "/app/td-llm-dnd.py"]
