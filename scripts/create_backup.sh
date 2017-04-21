#!/usr/bin/env sh

# The source folder for the backup.
SOURCE="${JENKINS_FOLDER}"
# The S3 destination bucket.
DESTINATION="s3://${S3_ENDPOINT}/${S3_BUCKET_NAME}/${S3_FOLDER_NAME}"

duplicity \
  --full-if-older-than 1W \
  --exclude=".m2" \
  --exclude=builds \
  --exclude=".*" \
  --s3-use-multiprocessing \
  --s3-use-new-style \
  ${SOURCE} ${DESTINATION}
