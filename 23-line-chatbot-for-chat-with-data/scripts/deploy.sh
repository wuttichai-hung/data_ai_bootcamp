source ./scripts/init.sh
gcloud config set project $PROJECT_ID

echo "GCP Project ID: $PROJECT_ID"
echo "Function Name: $FUNCTION_NAME"
echo "Entry Point: $ENTRY_POINT"

gcloud functions deploy $FUNCTION_NAME \
    --gen2 \
    --trigger-http \
    --region=asia-southeast1 \
    --runtime=python312 \
    --source=. \
    --entry-point=$ENTRY_POINT \
    --allow-unauthenticated \
    --env-vars-file=line_secret.yml \
    --timeout=300 \
    --memory=512MiB