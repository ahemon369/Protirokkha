class NotificationService:
    @staticmethod
    async def send_sos_notification(phone: str, location: str):
        """Send SOS notification to emergency contacts"""
        # In production, integrate with SMS/Push notification service
        print(f"Sending SOS notification to {phone}: Emergency at {location}")
    
    @staticmethod
    async def send_defender_notification(sos_id: str, defender_count: int):
        """Notify user about defenders responding"""
        print(f"SOS {sos_id}: {defender_count} defenders responding")
    
    @staticmethod
    async def send_safe_notification(phone: str):
        """Send notification that user is safe"""
        print(f"User {phone} marked as safe")
