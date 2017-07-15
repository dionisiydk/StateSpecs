accessing
debugValidationFailingOver: aSpecFailed
	"
	[SpecDSLAcceptanceTests new customTestForArbitraryBlock] fork
	"
	| mainProcess |
	aSpecFailed allowExtraDebugging.
	UnhandledError signalForException: aSpecFailed.

	mainProcess := Processor activeProcess.
	[
	mainProcess 
		completeTo: aSpecFailed signalerContext sender; 
		restartTop;	
		stepToHome: predicate asContext;
		debug] forkAt: mainProcess priority.
	mainProcess suspend