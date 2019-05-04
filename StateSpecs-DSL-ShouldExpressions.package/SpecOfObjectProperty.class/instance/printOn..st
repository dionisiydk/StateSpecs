printing
printOn: aStream

	aStream << '"' << value asString << '" from ' << self stringForSpecTitle
