FROM python:3.8.10
RUN ["mkdir", "/work_dir"]
COPY generate_and_evaluate.py  /work_dir
WORKDIR /work_dir

CMD ["python3", "generate_and_evaluate.py"]