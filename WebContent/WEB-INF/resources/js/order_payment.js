var orderAmount = 0;
var allAmount = 0;
var opt__list = new Array();
var opt__all = new Array();

function weekDicountCalcul(str, days) {
   str = str.replace(/,/gm, "");
   var matchData = str.match(/[0-9]+주 [0-9]+(\s|원|$)/gmu);

   if (matchData === null) return null;

   if (days % 7 != 0) return null;

   var currentWeek = days / 7;

   // console.log("matchData", matchData);
   for (var i = 0; i < matchData.length; i++) {
      var week = matchData[i].match(/[0-9]+주/u);
      var price = matchData[i].match(/[0-9]+(원|\n|$)/u);

      var week = parseInt(week[0].replace("주", ""));
      var price = parseInt(price[0].replace(/(원|\n|$)/u, ""));

      if (currentWeek == week) return price;
   }
}

function up_promotion(idx) {
    var getCnt = document.getElementById("cnt" + idx);
    var nowCount = parseInt(getCnt.value);
    getCnt.value = nowCount + 1;
    amount();
}

function down_promotion(idx) {
    var getCnt = document.getElementById("cnt" + idx);
    var nowCount = parseInt(getCnt.value);
    if (nowCount > 0) {
        getCnt.value = nowCount - 1;
        amount();
    }
}

function amount() {
   allAmount = 0; // 소계만 계산할 변수

   const count__list = document.querySelectorAll(".count");

   // 소계를 계산하는 로직
   for (var i = 0; i < count__list.length; i++) {
      var cnt = count__list.item(i);
      var price = cnt.dataset.price * cnt.value;

      if (cnt.value == 0) continue;

      allAmount += price;
   }

   // 소계 업데이트
   document.getElementById("allAmount").textContent = new Intl.NumberFormat().format(allAmount) + "원";
}

function checkNum(idx) {
   var check = document.getElementById("cnt" + idx);
   var nowValue = parseInt(check.value);
   if (nowValue > 0) {
      amount();
   } else {
      check.value = 0;
   }
}

function chg_payment(e) {
   const payment__list = document.querySelectorAll(".payment");
   for (var i = 0; i < payment__list.length; i++) {
      payment__list.item(i).classList.remove("on");
   }
   document.querySelector("." + e).classList.add("on");
}

const optionList = document.querySelectorAll(".option");
const tranMgr = "/order/pay.php";
const tempUrl = "/data/order/temp2.php";
const pid = 4;
const dlv_price = 0;

function send_artmap(type) {
   var name = document.querySelector("#name").value;
   var hp = document.querySelector("#hp").value;
   var email = document.querySelector("#email").value;
   var info = document.querySelector("#info").value;
   var ordernum = document.querySelector("#ordernum").value;

   if (!name) {
      alert("성함을 입력해주세요");
      return false;
   }
   if (!hp) {
      alert("연락처를 입력해주세요");
      return false;
   }
   if (!email) {
      alert("이메일을 입력해주세요");
      return false;
   }
   if (!info) {
      alert("문의내용을 입력해주세요");
      return false;
   }
   if (opt__all.length == 0) {
      alert("1개 이상 프로모션을 선택해주세요");
      return false;
   }

   var formData = new FormData();

   formData.append("name", name);
   formData.append("hp", hp);
   formData.append("email", email);
   formData.append("info", info);
   formData.append("list", JSON.stringify(opt__all));
   formData.append("type", type);
   if (document.querySelector("#file").files[0]) formData.append("file", document.querySelector("#file").files[0]);

   if (type == "save") {
      formData.append("ordernum", ordernum);
      artmap_post("/order/artmap_pro.php", formData);
   }
   if (type == "send") {
      html2canvas(document.querySelector("#canvas-target-2"), {
         scale: 0.8,
      }).then((canvas) => {
         formData.append("imgData", canvas.toDataURL());
         artmap_post("/order/artmap_pro.php", formData);
      });
   }
}

function send_artmap_temp() {
   var name = document.querySelector("#name").value;
   var hp = document.querySelector("#hp").value;
   var email = document.querySelector("#email").value;
   var info = document.querySelector("#info").value;

   var formData = new FormData();

   formData.append("name", name);
   formData.append("hp", hp);
   formData.append("email", email);
   formData.append("info", info);
   formData.append("list", JSON.stringify(opt__all));
   formData.append("type", "temp");
   if (document.querySelector("#file").files[0]) formData.append("file", document.querySelector("#file").files[0]);

   html2canvas(document.querySelector("#canvas-target-2"), {
      scale: 0.9,
   }).then((canvas) => {
      formData.append("imgData", canvas.toDataURL());

      fetch("/order/artmap_pro.php", {
         method: "POST",
         body: formData,
      });
   });
}

async function artmap_post(url, data) {
   const response = await fetch(url, {
      method: "POST",
      body: data,
   })
      .then((response) => response.text())
      .then((response) => {
         // console.log(response);
         window.onArtmap_post = true;
         alert(response.trim());
         // location.reload();
      })
      .catch((err) => {
         console.warn(err);
      });
}

function on_order() {
   var payMethodLength = document.querySelectorAll('input[name="paymethod"]:checked').length;
   var name = document.querySelector("#name");
   var hp = document.querySelector("#hp");
   var email = document.querySelector("#email");
   var orderAmount__input = document.querySelector("#orderAmount__input");

   if (orderAmount__input.value == 0) {
      alert("바로결제가능한 상품이 없습니다.");
      return false;
   }
   if (!name.value) {
      alert("성함을 입력해주세요");
      return false;
   }
   if (!hp.value) {
      alert("연락처를 입력해주세요");
      return false;
   }
   if (!payMethodLength) {
      alert("결제수단을 선택해주세요");
      return false;
   }
   if (!window.onArtmap_post) {
      alert("아트맵에 보내기를 먼저 클릭해주세요");
      return false;
   }
   // setTimeout(send_artmap_temp, 1);
   onPay();
}

function onPay() {
   var name = document.querySelector("#name").value;
   var hp = document.querySelector("#hp").value;
   var email = document.querySelector("#email").value;
   var info = document.querySelector("#info").value;
   var paymethod = document.querySelectorAll('input[name="paymethod"]:checked');
   var orderAmount__input = document.querySelector("#orderAmount__input").value;
   var formData = new FormData();
   formData.append("name", name);
   formData.append("hp", hp);
   formData.append("email", email);
   formData.append("msg", info);
   formData.append("pid", pid);
   formData.append("count", 1);
   formData.append("dlv_price", dlv_price);
   formData.append("paymethod", paymethod[0].value);
   formData.append("total", orderAmount__input);
   formData.append("optlist", JSON.stringify(opt__list));
   if (document.querySelector("#file").files[0]) formData.append("file", document.querySelector("#file").files[0]);
   postData(tempUrl, formData);
}
async function postData(url = "", data) {
   const response = await fetch(url, {
      method: "POST",
      body: data,
   })
      .then((response) => response.text())
      .then((response) => {
         var paymethod = document.querySelectorAll('input[name="paymethod"]:checked');
         var check_window = window.open(
            "/order/payreq_crossplatform_estimate.php?order_code=" + response.trim() + "&ptype=" + paymethod[0].value,
            "_blank",
            "width=650px,height=650px,scrollbars=no,location=no"
         );
      })
      .catch((err) => {
         console.warn(err);
      });
}

function layer_open(el) {
   var temp = $("#" + el);
   var bg = temp.prev().hasClass("bg");
   if (bg) {
      $("." + el).fadeIn();
   } else {
      temp.fadeIn();
   }

   if (temp.outerHeight() < $(document).height()) temp.css("margin-top", "-" + temp.outerHeight() / 2 + "px");
   else temp.css("top", "0px");
   if (temp.outerWidth() < $(document).width()) temp.css("margin-left", "-" + temp.outerWidth() / 2 + "px");
   else temp.css("left", "0px");
   temp.find("a.cbtn").click(function (e) {
      if (bg) {
         $("." + el).fadeOut();
      } else {
         temp.fadeOut();
      }
      e.preventDefault();
   });
   $("." + el + " .bg").click(function (e) {
      $("." + el).fadeOut();
      e.preventDefault();
   });
}

function saveEstimate() {
   var name = document.querySelector("#name").value;
   var hp = document.querySelector("#hp").value;
   var email = document.querySelector("#email").value;
   var info = document.querySelector("#info").value;

   var limit = 15;
   var today = new Date();
   var date = today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
   var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
   var datetime = date + " " + time;

   for (var i = limit - 1; i > 0; i--) {
      if (localStorage.getItem("estimate_" + (i - 1)) != null) {
         localStorage.setItem("estimate_" + i, 1);
         localStorage.setItem("estimate_" + i + "_name", localStorage.getItem("estimate_" + (i - 1) + "_name"));
         localStorage.setItem("estimate_" + i + "_hp", localStorage.getItem("estimate_" + (i - 1) + "_hp"));
         localStorage.setItem("estimate_" + i + "_email", localStorage.getItem("estimate_" + (i - 1) + "_email"));
         localStorage.setItem("estimate_" + i + "_info", localStorage.getItem("estimate_" + (i - 1) + "_info"));
         localStorage.setItem("estimate_" + i + "_list", localStorage.getItem("estimate_" + (i - 1) + "_list"));
         localStorage.setItem("estimate_" + i + "_datetime", localStorage.getItem("estimate_" + (i - 1) + "_datetime"));
      }
   }

   localStorage.setItem("estimate_0", 1);
   localStorage.setItem("estimate_0_name", name);
   localStorage.setItem("estimate_0_hp", hp);
   localStorage.setItem("estimate_0_email", email);
   localStorage.setItem("estimate_0_info", info);
   localStorage.setItem("estimate_0_list", JSON.stringify(opt__all));
   localStorage.setItem("estimate_0_datetime", datetime);

   layerListEstimate();

   alert("내 견적리스트에 저장했습니다");

   layer_open("layer");
}

function loadEstimate() {
   var limit = 15;

   var response_data = [];

   for (var i = 0; i < limit; i++) {
      if (localStorage.getItem("estimate_" + i) != null) {
         response_data.push({
            index: i,
            name: localStorage.getItem("estimate_" + i + "_name"),
            hp: localStorage.getItem("estimate_" + i + "_hp"),
            email: localStorage.getItem("estimate_" + i + "_email"),
            info: localStorage.getItem("estimate_" + i + "_info"),
            list: localStorage.getItem("estimate_" + i + "_list"),
            datetime: localStorage.getItem("estimate_" + i + "_datetime"),
         });
      }
   }

   return response_data;
}

function layerListEstimate() {
   var data = loadEstimate();

   var HTML = "";

   data.forEach(function (row) {
      var append = `<tr>`;
      append += `
         <td>${row.datetime}</td>
         <td><a style='color:#707070; cursor: pointer;' onClick="setEstimate(${row.index})">불러오기</a></td>
         <td><a style='color:#707070; cursor: pointer;' onClick="deleteEstimate(${row.index})">삭제</a></td>
      `;
      append += `</tr>`;

      HTML += append;
   });

   var appendTarget = document.querySelector("#load_list_target");
   appendTarget.innerHTML = HTML;
}

// 불러오기
function setEstimate(index) {
   var list = JSON.parse(localStorage.getItem("estimate_" + index + "_list"));

   for (var i = 0; list.length > i; i++) {
      var idx = list[i].idx;
      var cnt = list[i].cnt;
      var options = list[i].options;
      document.getElementById("cnt" + idx).value = cnt;

      for (var j = 0; j < options.length; j++) {
         var tr = document.querySelector("#promotion-" + idx);
         var optionCheck = tr.querySelector(".options input[type=checkbox]:nth-child(" + (parseInt(options[j].index) + 1) + ")");
         optionCheck.checked = true;
      }
   }
   document.getElementById("name").value = localStorage.getItem("estimate_" + index + "_name");
   document.getElementById("hp").value = localStorage.getItem("estimate_" + index + "_hp");
   document.getElementById("email").value = localStorage.getItem("estimate_" + index + "_email");
   document.getElementById("info").value = localStorage.getItem("estimate_" + index + "_info");
   amount();
   $(".layer").fadeOut();
}

// 삭제하기
function deleteEstimate(index) {
   var limit = 15;

   localStorage.removeItem("estimate_" + index);
   localStorage.removeItem("estimate_" + index + "_name");
   localStorage.removeItem("estimate_" + index + "_hp");
   localStorage.removeItem("estimate_" + index + "_email");
   localStorage.removeItem("estimate_" + index + "_info");
   localStorage.removeItem("estimate_" + index + "_list");
   localStorage.removeItem("estimate_" + index + "_datetime");

   for (var i = index; i < limit; i++) {
      if (localStorage.getItem("estimate_" + (i + 1)) != null) {
         localStorage.setItem("estimate_" + i, 1);
         localStorage.setItem("estimate_" + i + "_name", localStorage.getItem("estimate_" + (i + 1) + "_name"));
         localStorage.setItem("estimate_" + i + "_hp", localStorage.getItem("estimate_" + (i + 1) + "_hp"));
         localStorage.setItem("estimate_" + i + "_email", localStorage.getItem("estimate_" + (i + 1) + "_email"));
         localStorage.setItem("estimate_" + i + "_info", localStorage.getItem("estimate_" + (i + 1) + "_info"));
         localStorage.setItem("estimate_" + i + "_list", localStorage.getItem("estimate_" + (i + 1) + "_list"));
         localStorage.setItem("estimate_" + i + "_datetime", localStorage.getItem("estimate_" + (i + 1) + "_datetime"));
      } else {
         localStorage.removeItem("estimate_" + i);
         localStorage.removeItem("estimate_" + i + "_name");
         localStorage.removeItem("estimate_" + i + "_hp");
         localStorage.removeItem("estimate_" + i + "_email");
         localStorage.removeItem("estimate_" + i + "_info");
         localStorage.removeItem("estimate_" + i + "_list");
         localStorage.removeItem("estimate_" + i + "_datetime");
      }
   }

   layerListEstimate();
}