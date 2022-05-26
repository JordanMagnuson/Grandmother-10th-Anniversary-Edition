photoArray = noone;
soundArray = noone;
currentIndex = 0;
myFinished = false;
loop = false;

currentPhoto = noone; //oPhotoBackdrop
lastPhoto = noone; //oPhotoBackdrop

waitTime = 0;
self.alarm[0] = -1; //waitAlarm

function PhotoControllerLeaving(_photoArray, _soundArray = noone, _waitTime = 1) {
	self.photoArray = _photoArray;
	self.soundArray = _soundArray;

	self.currentPhoto = instance_create_depth(self.x, self.y, self.depth, oPhotoBackdrop);
	self.currentPhoto.PhotoBackdrop(_photoArray[self.currentIndex], _soundArray[self.currentIndex], 1, global.PHOTO_FADE_OUT_DURATION);

	self.waitTime = _waitTime;
	
}

function added() {
	self.alarm[0] = self.waitTime * room_speed;
	self.currentPhoto.added();
	self.currentIndex++;
}

//Unused fadeIn parameter
function nextPhoto(_fadeIn = true) {
	if(self.myFinished && !self.loop) {
		return;
	}
	if(self.currentIndex < array_length(self.photoArray)) {
		self.lastPhoto = self.currentPhoto;
		self.lastPhoto.fadeOut();
		self.currentPhoto = instance_create_depth(self.x, self.y, self.depth, oPhotoBackdrop);
		self.currentPhoto.PhotoBackdrop(self.photoArray[self.currentIndex], self.soundArray[self.currentIndex], global.PHOTO_FADE_IN_DURATION, global.PHOTO_FADE_OUT_DURATION);
		self.currentPhoto.added();
	}
	else {
		self.myFinished = true;
		self.currentIndex = 0;
		if(self.loop) {
			self.lastPhoto = self.currentPhoto;
			self.lastPhoto.fadeOut();
			self.currentPhoto = instance_create_depth(self.x, self.y, self.depth, oPhotoBackdrop);
			self.currentPhoto.PhotoBackdrop(self.photoArray[self.currentIndex], self.soundArray[self.currentIndex], global.PHOTO_FADE_IN_DURATION, global.PHOTO_FADE_OUT_DURATION);
			self.currentPhoto.added();
		}
	}
	self.currentIndex++;
	
	self.alarm[0] = (self.waitTime + global.PHOTO_FADE_IN_DURATION) * room_speed;
}