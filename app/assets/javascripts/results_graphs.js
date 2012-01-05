$(function() {
	var backgroundColors = [ "#be2025", "#ed2024", "#ef4b23", "#faa41a", "#fdd803", "#f3ec1a", "#b3d334", "#61bc46", "#549140", "#166432" ];

	$(".cover-page").each(function() {
		var assessmentResultCoverPageGraph = $(this).find(".cover-page-graph")[0];
		var context = assessmentResultCoverPageGraph.getContext("2d");

		var height = assessmentResultCoverPageGraph.offsetHeight;
		var width = assessmentResultCoverPageGraph.offsetWidth;

		var i;

		for (i = 0; i < 10; i++) {
			context.beginPath();
			context.rect((i * ((width - 100) / 10)) + 50, 0, (width - 100) / 10, height);
			context.fillStyle = backgroundColors[i];
			context.fill();
			context.closePath();
		}

		context.shadowOffsetX = 0;
		context.shadowOffsetY = 0;
		context.shadowBlur = 5;
		context.shadowColor = "rgba(64, 64, 65, 0.5)";

		context.fillStyle = "#404041";
		context.font = "bold 50px sans-serif";

		context.fillText($(this).find(".assessment-title").text(), 25, 70);

		context.font = "bold 38px sans-serif";

		context.fillText("Results", 25, 110);

		i = 0;

		context.strokeStyle = "#404041";
		context.lineWidth = 3;

		$(this).find(".section").each(function() {
			context.shadowBlur = 0;
			context.shadowColor = "rgba(0, 0, 0, 0.0)";

			context.beginPath();
			context.moveTo(74.5, 200.5 + (i * 50));
			context.lineTo(width - 74.5, 200.5 + (i * 50));
			context.stroke();
			context.closePath();

			var sectionScore = parseInt($(this).find(".section-score").text());
		    var sectionMinScore = parseInt($(this).find(".section-min-score").text());
		    var sectionMaxScore = parseInt($(this).find(".section-max-score").text());
			var sectionPercent = Math.round((Math.abs(sectionScore - sectionMinScore) / Math.abs(sectionMaxScore - sectionMinScore)) * 100);

			context.font = "14px sans-serif";
			context.shadowBlur = 3;
			context.shadowColor = "rgba(255, 255, 255, 0.8)";
			context.fillText($(this).find(".section-title").text(), 50 + Math.round((sectionPercent / 100) * 800), 220.5 + (i * 50));

			i++;
		})
	});
});