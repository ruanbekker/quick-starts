from pyspark.sql import SparkSession

# Step 1: Initialize Spark Session
spark = SparkSession.builder.appName("WordCount").getOrCreate()

# Step 2: Read Data
text_file = spark.sparkContext.textFile("/src/data.txt")

# Step 3: Data Processing for Word Count
word_counts = text_file.flatMap(lambda line: line.split(" ")) \
                       .map(lambda word: (word, 1)) \
                       .reduceByKey(lambda a, b: a + b)

# Additional Step: Counting All Words
total_words = word_counts.map(lambda x: x[1]).reduce(lambda a, b: a + b)

# Step 4: Output the Results
# Print individual word counts
for word, count in word_counts.collect():
    print(f"{word}: {count}")

# Print total word count
print(f"Total number of words: {total_words}")

# Stop the SparkSession
spark.stop()

