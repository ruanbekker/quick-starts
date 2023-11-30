import uuid
import base64

# Original UUID
original_uuid = uuid.uuid4()

# Convert to bytes
uuid_bytes = original_uuid.bytes

# Encode to base64
encoded_uuid = base64.urlsafe_b64encode(uuid_bytes).decode('utf-8').rstrip("=")

print(encoded_uuid)

