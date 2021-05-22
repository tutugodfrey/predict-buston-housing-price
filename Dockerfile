FROM python:3.7.3-stretch

# Create a working directory
WORKDIR /app

# Copy source code to working directory
COPY app.py requirements.txt ./
COPY output_txt_files /app/output_txt_files
COPY model_data  /app/model_data

# Install packages from requirements.txt
# hadolint ignore=DL3013
# hadolint ignore=DL3042
RUN pip install -r requirements.txt

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python3", "app.py"]
