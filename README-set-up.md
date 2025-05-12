
# Project Setup Guide

## Overview

This project involves setting up **dbt (Data Build Tool)** inside a Docker container, running transformations on **PostgreSQL**, and serving **dbt docs** for visualization.

## Architecture

![alt text](image.png)

## Setup Instructions

### 1. Make sure docker is running on your machine


### 2. Git clone this repository
```sh
git clone https://github.com/Jafar-design/data_loading_with_miva
```

### 3. Create a virtual environment and activate
```sh
python3 venv venv
```
For Unix OS:
```sh
source venv/bin/activate
```
For Windows OS:
```sh
source venv/Scripts/activate
```

### 4. Run the following command to build this project
This installs the necessary packages and dependencies
```sh
docker compose up --build
```

### 4. Visit this Github Pages site to view the project documentation and data lineage
[GithubPagesLink](https://jafar-design.github.io/data_loading_with_miva/)
