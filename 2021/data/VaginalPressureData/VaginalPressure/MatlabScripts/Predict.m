function [	fNextFatigued,			...
			fNextActive,			...
			fNextRested		] =		...
				Predict(			...
					tModel,			...
					fFatigued,		...
					fActive,		...
					fRested,		...
					bActivity		)
	%
	fNextFatigued =												...
			tModel.fPhiFatiguedToActive * fFatigued				...
		+	( 1 - tModel.fPhiActiveToFatigued ) * fActive;
	%
	fNextActive =												...
			tModel.fPhiActiveToFatigued * fActive				...
		+	( 1 - tModel.fPhiFatiguedToActive ) * fFatigued		...
		+	bActivity * tModel.fPhiRestedToActive * fRested		...
		-	( 1 - bActivity ) * tModel.fPhiActiveToRested * fActive;
	%
	fNextRested =						...
			tModel.fTotalMuscularUnits	...
		-	fNextActive					...
		-	fNextFatigued;
	%
end % function
