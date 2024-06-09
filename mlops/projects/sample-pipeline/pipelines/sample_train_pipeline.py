from google.cloud import aiplatform


def main() -> None:
    aiplatform.init(
        project="aitech-good-s17919",
        location="asia-northeast1",
        experiment=None,
        experiment_description=None,
        experiment_tensorboard=None,
        staging_bucket="gs://aitech-good-s17919-vertex",
        credentials=None,
        encryption_spec_key_name=None,
        network="aitech-good-s17919/444618444807/global/networks/ml-network",
        service_account="vertex-account@aitech-good-s17919.iam.gserviceaccount.com",
        api_endpoint=None,
        api_transport=None,
        request_metadata=None,
    )

    pipeline_job = aiplatform.PipelineJob(
        display_name="sample-train-pipeline-display-name",
        template_path="https://asia-northeast1-kfp.pkg.dev/aitech-good-s17919/pipelines/sample-train-pipeline/latest",
        job_id="sample-train-pipeline-job-id",
        parameter_values=None,
        input_artifacts=None,
        enable_caching=True,
        encryption_spec_key_name=None,
        labels=None,
        credentials=None,
        project="aitech-good-s17919",
        location="asia-northeast1",
        failure_policy="fast",
    )

    pipeline_job.submit(
        service_account="vertex-account@aitech-good-s17919.iam.gserviceaccount.com",
        network="aitech-good-s17919/444618444807/global/networks/ml-network",
        reserved_ip_ranges=["ml-network-subnet"],
        create_request_timeout=600,
        experiment=None,
    )


if __name__ == "__main__":
    main()
