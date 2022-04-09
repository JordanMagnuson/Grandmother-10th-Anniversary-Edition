photoArray = array_create(0);
soundArray = array_create(0);
clickMaskArray = array_create(0);
currentIndex = 0;
myFinished = false;
loop = false;

currentPhoto = noone; //oPhotoBackdrop
lastPhoto = noone; //oPhotoBackdrop

function PhotoController(_photoArray, _soundArray = noone, _clickMaskArray = noone) {
	self.photoArray = _photoArray;
	self.soundArray = _soundArray;
	self.clickMaskArray = _clickMaskArray;
	self.currentPhoto = instance_create_depth(self.x, self.y, self.depth, oPhotoBackdrop);
	self.currentPhoto.PhotoBackdrop(_photoArray[self.currentIndex], _soundArray[self.currentIndex], global.PHOTO_FADE_IN_DURATION, global.PHOTO_FADE_OUT_DURATION, _clickMaskArray[self.currentIndex]);
}

function added() {
	self.nextPhoto();	
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
		self.currentPhoto.PhotoBackdrop(self.photoArray[self.currentIndex], self.soundArray[self.currentIndex], global.PHOTO_FADE_IN_DURATION, global.PHOTO_FADE_OUT_DURATION, self.clickMaskArray[self.currentIndex]);
		self.currentPhoto.added();
	}
	else {
		self.myFinished = true;
		self.currentIndex = 0;
		if(self.loop) {
			self.lastPhoto = self.currentPhoto;
			self.lastPhoto.fadeOut();
			self.currentPhoto = instance_create_depth(self.x, self.y, self.depth, oPhotoBackdrop);
			self.currentPhoto.PhotoBackdrop(self.photoArray[self.currentIndex], self.soundArray[self.currentIndex], global.PHOTO_FADE_IN_DURATION, global.PHOTO_FADE_OUT_DURATION, self.clickMaskArray[self.currentIndex]);
			self.currentPhoto.added();
		}
	}
	self.currentIndex++;
}