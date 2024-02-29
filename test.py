# # Import necessary modules
# from llama_cpp import Llama
# from wurlitzer import pipes

# # Set up client with model path and context size
# with pipes() as (out, err):
#     client = Llama(
#         model_path="DuckDB-NSQL-7B-v0.1-q8_0.gguf",
#         n_ctx=2048,
#     )

from llama_cpp import Llama
from wurlitzer import pipes

with pipes() as (out, err):
    llama = Llama(
        model_path="DuckDB-NSQL-7B-v0.1-q8_0.gguf",
        n_ctx=2048,
    )
    
text = """### Instruction:
Your task is to generate valid duckdb SQL to answer the following question, given a duckdb database schema.

### Input:
Here is the database schema that the SQL query will run on:
CREATE TABLE rideshare (
    hvfhs_license_num varchar,
    dispatching_base_num varchar,
    originating_base_num varchar,
    request_datetime timestamp,
    on_scene_datetime timestamp,
    pickup_datetime timestamp,
    dropoff_datetime timestamp,
    trip_miles double,
    trip_time bigint,

);

### Question:
get longest trip in december 2022

### Response (use duckdb shorthand if possible):
"""

with pipes() as (out, err):
    pred = llama(text, temperature=0.1, max_tokens=500)
print(pred["choices"][0]["text"])
print("foo")