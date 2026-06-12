from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when

spark = SparkSession.builder.appName("FraudAnalysisJob").getOrCreate()

source_path = "s3://replace-with-bucket/processed/transactions/"
target_path = "s3://replace-with-bucket/analytics/fraud-risk/"

transactions = spark.read.parquet(source_path)

risk_data = transactions.withColumn(
    "risk_level",
    when(col("amount").cast("double") > 100000, "HIGH")
    .when(col("amount").cast("double") > 50000, "MEDIUM")
    .otherwise("LOW")
)

risk_data.write.mode("overwrite").parquet(target_path)

spark.stop()
