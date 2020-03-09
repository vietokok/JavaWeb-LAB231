this.timeRemaining = 60;
this.timeDisplay = document.getElementById("timeDisplay");
this.questionPos = document.getElementById("qustionPos");
this.currentQuiz = 0;
this.currentDiv = null;
this.testing = 0;
this.numOfQuiz = 0;

function nextQuestion() {
    if (this.currentDiv !== null) {
        this.currentDiv.classList.add("hidden");
    }
    currentDiv = document.getElementById("q" + currentQuiz);
    currentDiv.classList.remove("hidden");
    currentQuiz = (currentQuiz % numOfQuiz) + 1;
    questionPos.textContent = "Question: " + currentQuiz + "/" + numOfQuiz;
    if (currentQuiz === numOfQuiz) {
        currentQuiz = 0;
    }
}
var bt = document.getElementById("bt-next");
bt.onclick = function () {
    nextQuestion();
};

var quizStart = function () {
    testing = 1;
    nextQuestion();
    var loop = setInterval(function () {
        timeRemaining--;
        updateTime();
        if (timeRemaining <= 0) {
            testing = 0;
            document.getElementById("quizForm").submit();
            clearInterval(loop);
        }
    }, 1000);
};

var updateTime = function () {
    var time = Math.floor(timeRemaining / 60);
    var sec = timeRemaining % 60;
    timeDisplay.textContent = time + ":" + sec;
};

window.onbeforeunload = function () {
    if (testing !== 0)
        return "Are you sure?";
};

var setNumOfQuiz = function (n) {
    numOfQuiz = n;
    this.timeDisplay = document.getElementById("timeDisplay");
    this.questionPos = document.getElementById("qustionPos");
    this.currentQuiz = 0;
    this.currentDiv = null;
    this.testing = 0;
    this.timeRemaining = numOfQuiz * 20;
};

