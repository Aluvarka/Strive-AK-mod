###BRP - 2019/07/29
## This file contains utilities for calculating a color along a spectrum
## and then converting that value into an appropriate Hex-String notation

##Expects a float value between 0.0 and 1.0 (in other words, a percentage)
##Values outside range are accepted and will simply return pure Red or Green
##Returns an RGB hex value that gradiates from 0 = Red to 1 = Green
const myhex = [0,1,2,3,4,5,6,7,8,9,"A","B","C","D","E","F"]
static func r2g(val):
	var hex = ''
	var num = val*2

	if num>1:	#if value is over 50% (value of 1-2) full then it is GREEN based
		hex += "#%sFF00"
		num = (2-num)*16	#value of 2=100%=00=green
							#value of 1=50%=FF=yellow
	else:		#if value is below 50% (value of 0-1) full then it is RED based
		hex += "#FF%s00"
		num = num*16		#value of 1=50%=FF=yellow
							#value of 0=0%=00=red
	num = min(15, max(0, round(num)))	#just to make sure we end up with a valid index value
	hex = hex % str(myhex[num], myhex[num])

	return hex
