<%@ page language="C#" autoeventwireup="true" inherits="Reports, App_Web_reports.aspx.cdcab7d2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Reports</title>
    <script type="text/javascript">

        //自定义messagebox回调函数------------------------------------------------------------------
       <%-- function fun_callbk(msg)
        {
            <%=this.ClientScript.GetCallbackEventReference(this,"msg","showMsg",null)%>
        }--%>

        //function showMsg(rValue)
        //{
        //    alert(rValue);
        //}
        //------------------------------------------------------------------------------------

        /*SN输入长度合法性检查，不能超过10个，并去除多余的SN*/
        function CheckLength(obj,maxlines)
        {
            var arr = obj.value.split("\n");

            if (arr.length > maxlines)
            {
                var value="";
                alert('Please make sure Max 10 SNs at one time，The excess will automatically truncate！');
                for (loop = 0; loop < maxlines; loop++)
                {
                    if (loop != maxlines - 1)
                        value=value + arr[loop] + "\n";
                    else
                        value = value + arr[loop];
                }
                obj.value = value;
            }
        }

        /*综合合法性检查*/
        function Check(textbox_obj, maxlines)
        {
            if (document.getElementById("Common").checked == false && document.getElementById("Russia").checked == false)
            {
                alert('Please choose at least one kind of Certification !');
                return false;
            }
            if (textbox_obj.value == null || textbox_obj.value == "")
            {
                alert("Please input at least one SN !");
                return false;
            }
            CheckLength(textbox_obj, maxlines);
            return true;
        }

        /*click here  显示SN信息指示*/
        function ShowInfo(targetid) {
            var infopan = new Array();
            infopan[0] = "iEM2000";
            infopan[1] = "iEM3000";
            infopan[2] = "PM3000";

            for(var i = 0;i < 3;i++)
            {
                if (document.getElementById) {

                    panid = document.getElementById(infopan[i]);

                    if (panid.style.display == "block") {
                        panid.style.display = "none";
                        if(panid == document.getElementById(targetid))
                            return;
                    }
                }
            }

            panid = document.getElementById(targetid);
            panid.style.display = "block"
        }

        /*  X 关闭SN信息指示*/
        function CloseInfo(targetid) {
            if (document.getElementById) {
                infopan = document.getElementById(targetid);
                infopan.style.display = "none";
            }

        }

        //分析SN
        //function analy_barcode_format(barcode) {
        //    var temp = "";
        //    var type_id, i;
        //    var le = new Array();

        //    if (barcode == "" || isnull(barcode) == true) {
        //        alert("The input barcode is empty. Please input again.");
        //        return -1;
        //    }

        //    le[1] = len(barcode);
        //    if (le[1] != 18 && le[1] != 14 && le[1] != 9 && le[1] != 10) {
        //        alert("The length of input barcode is invalid. Please input again.");
        //        return -2;
        //    }

        //    if (le[1] == 18)	//Swift 5A/63A/125A全长条码
        //    {
        //        temp = Left(barcode, 2)
        //        if (temp != "WX") {
        //            alert("The first two characters in the Swift's barcode must be WX. Please input again.");
        //            return -3;
        //        }

        //        barcode = barcode;

        //        return barcode;
        //    }

        //    if (le[1] == 14)		//18mm，全长条码
        //    {
        //        temp = Left(barcode, 2);
        //        if (temp != "WX") {
        //            alert("The first two characters in the 18mm's barcode must be WX. Please input again.");
        //            return -3;
        //        }

        //        temp = Mid(barcode, 3, 1)
        //        if (temp != "0" && temp != "2" && temp != "3" && temp != "4" && temp != "5") {
        //            alert("The 3rd character in the 18mm's barcode must be 0-2-3-4-5. Please input again.");
        //            return -4;
        //        }

        //        barcode = barcode;

        //        return barcode;
        //    }

        //    if (le[1] == 9 || le[1] == 10)				//Swift，缩写代码
        //    {
        //        if (le[1] == 9)
        //            le[2] = 1;
        //        else
        //            le[2] = 2;

        //        temp = Left(barcode, le[2]);
        //        if (isnumber(temp) != true) {
        //            alert("The " + string(le[2]) + " characters in the start of Swift's simple barcode must between number. Please input again.");
        //            return -5;
        //        }

        //        type_id = temp;
        //        for (i = 1 ; i <= glo_Product_Counts ; i++) {
        //            if (type_id == glo_Product[i].code) {
        //                temp = Right(barcode, le[1] - le[2]);
        //                barcode = "WX" + glo_Product[i].UV + temp;

        //                exit;
        //            }
        //        }
        //        if (i == glo_Product_Counts + 1) {
        //            alert("The " + string(le[2]) + " characters in the start of Swift's simple barcode is invalid. Please input again.");
        //            return -6;
        //        }

        //        return barcode;
        //    }
        //}

    </script>
    </head>

<body>
    <asp:Panel runat="server" ID="Background" style="left: 50%; position: absolute; width: 1000px;height:630px;  margin-left: -500px;padding-top:30px;padding-bottom:30px; ">
    <form id="form1" runat="server">

        <div style="display:none;"><asp:Label ID="info" runat="server" ></asp:Label></div>

        <div style="Z-INDEX: 2; POSITION: absolute; BACKGROUND-COLOR: #ffffff; OVERFLOW: hidden; TOP: 342px; LEFT: 424px" id="flyout"></div><!-- Info panel to be displayed as a flyout when the button is clicked -->
        <div style="Z-INDEX: 2;display:none; POSITION: absolute; BORDER-BOTTOM-STYLE: solid; BORDER-BOTTOM-COLOR: #9fa0a4; /*FILTER: progid:DXImageTransform.Microsoft.Alpha(opacity=0);*/ PADDING-BOTTOM: 5px; BORDER-RIGHT-STYLE: solid; BACKGROUND-COLOR: #ffffff; BORDER-TOP-COLOR: #9fa0a4; PADDING-LEFT: 5px; WIDTH: 300px; PADDING-RIGHT: 5px; BORDER-TOP-STYLE: solid; HEIGHT: 260px; BORDER-RIGHT-COLOR: #9fa0a4; FONT-SIZE: 12px; BORDER-LEFT-STYLE: solid; BORDER-LEFT-COLOR: #9fa0a4; TOP: 350px; PADDING-TOP: 5px; LEFT: 2px; /*opacity: 0*/" id="iEM2000">
            <div style="WIDTH: 54px; FLOAT: right; HEIGHT: 34px;" id="btnCloseParent1">
                <a style="TEXT-ALIGN: right; PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: black; FONT-SIZE: medium; FONT-WEIGHT: bold; TEXT-DECORATION: none; PADDING-TOP: 2px" id="btnClose1" title="Close" href='javascript:CloseInfo("iEM2000")'>X</a> 
            </div>
            <div style="HEIGHT: 14px;">
                <img style="BORDER-BOTTOM: #ffdd00 0px solid; POSITION: absolute; BORDER-LEFT: #ffdd00 0px solid; WIDTH: 250px; HEIGHT: 210px; BORDER-TOP: #ffdd00 0px solid; TOP: 31px; BORDER-RIGHT: #ffdd00 0px solid; LEFT: 25px" id="ImageiEM2000" src="Conzerv/iEM2000.jpg"/> 
                <%--<p><span style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 572px; FONT-FAMILY: Arial; HEIGHT: 28px; COLOR: #009b3e; FONT-SIZE: medium; TOP: 278px; FONT-WEIGHT: bold; LEFT: 1px" id="LBLLBL1">Please Refer to the Terminal Block of the Meter.</span> 
                </p>--%>

            </div>

        </div>
        <div style="Z-INDEX: 2;display:none; POSITION: absolute; BORDER-BOTTOM-STYLE: solid; BORDER-BOTTOM-COLOR: #9fa0a4; /*FILTER: progid:DXImageTransform.Microsoft.Alpha(opacity=0);*/ PADDING-BOTTOM: 5px; BORDER-RIGHT-STYLE: solid; BACKGROUND-COLOR: #ffffff; BORDER-TOP-COLOR: #9fa0a4; PADDING-LEFT: 5px; WIDTH: 300px; PADDING-RIGHT: 5px; BORDER-TOP-STYLE: solid; HEIGHT: 260px; BORDER-RIGHT-COLOR: #9fa0a4; FONT-SIZE: 12px; BORDER-LEFT-STYLE: solid; BORDER-LEFT-COLOR: #9fa0a4; TOP: 350px; PADDING-TOP: 5px; LEFT: 2px; /*opacity: 0*/" id="iEM3000">
            <div style="WIDTH: 54px; FLOAT: right; HEIGHT: 34px;" id="btnCloseParent2">
                <a style="TEXT-ALIGN: right; PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: black; FONT-SIZE: medium; FONT-WEIGHT: bold; TEXT-DECORATION: none; PADDING-TOP: 2px" id="btnClose2" title="Close" href='javascript:CloseInfo("iEM3000")'>X</a> 
            </div>
            <div style="HEIGHT: 14px">
                <img style="BORDER-BOTTOM: #ffdd00 0px solid; POSITION: absolute; BORDER-LEFT: #ffdd00 0px solid; WIDTH: 250px; HEIGHT: 210px; BORDER-TOP: #ffdd00 0px solid; TOP: 31px; BORDER-RIGHT: #ffdd00 0px solid; LEFT: 25px" id="ImageiEM3000" src="Conzerv/iEM3000.jpg"/> 
                <%--<p><span style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 572px; FONT-FAMILY: Arial; HEIGHT: 28px; COLOR: #009b3e; FONT-SIZE: medium; TOP: 278px; FONT-WEIGHT: bold; LEFT: 1px" id="LBLLBL2">Please Refer to the Terminal Block of the Meter.</span> 
                </p>--%>

            </div>

        </div>
        <div style="Z-INDEX: 2;display:none; POSITION: absolute; BORDER-BOTTOM-STYLE: solid; BORDER-BOTTOM-COLOR: #9fa0a4; /*FILTER: progid:DXImageTransform.Microsoft.Alpha(opacity=0);*/ PADDING-BOTTOM: 5px; BORDER-RIGHT-STYLE: solid; BACKGROUND-COLOR: #ffffff; BORDER-TOP-COLOR: #9fa0a4; PADDING-LEFT: 5px; WIDTH: 300px; PADDING-RIGHT: 5px; BORDER-TOP-STYLE: solid; HEIGHT: 260px; BORDER-RIGHT-COLOR: #9fa0a4; FONT-SIZE: 12px; BORDER-LEFT-STYLE: solid; BORDER-LEFT-COLOR: #9fa0a4; TOP: 350px; PADDING-TOP: 5px; LEFT: 2px; /*opacity: 0*/" id="PM3000">
            <div style="WIDTH: 54px; FLOAT: right; HEIGHT: 34px;" id="btnCloseParent3">
                <a style="TEXT-ALIGN: right; PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; COLOR: black; FONT-SIZE: medium; FONT-WEIGHT: bold; TEXT-DECORATION: none; PADDING-TOP: 2px" id="btnClose3" title="Close" href='javascript:CloseInfo("PM3000")'>X</a> 
            </div>
            <div style="HEIGHT: 14px">
                <img style="BORDER-BOTTOM: #ffdd00 0px solid; POSITION: absolute; BORDER-LEFT: #ffdd00 0px solid; WIDTH: 250px; HEIGHT: 210px; BORDER-TOP: #ffdd00 0px solid; TOP: 31px; BORDER-RIGHT: #ffdd00 0px solid; LEFT: 25px" id="ImagePM3000" src="Conzerv/PM3000.jpg"/> 
                <%--<p><span style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 572px; FONT-FAMILY: Arial; HEIGHT: 28px; COLOR: #009b3e; FONT-SIZE: medium; TOP: 278px; FONT-WEIGHT: bold; LEFT: 1px" id="LBLLBL3">Please Refer to the Terminal Block of the Meter.</span> 
                </p>--%>

            </div>

        </div>

        <asp:ImageButton style="position:absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 101px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 31px; BORDER-LEFT-WIDTH: 0px; TOP: 400px; LEFT: 702px" ImageUrl="Conzerv/submit.jpg" ID="ImageButton2" runat="server" Text="Submit" OnClick="submit_Click" OnClientClick="return Check(SNlist,10)" />

        <img style="POSITION: absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 163px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 49px; BORDER-LEFT-WIDTH: 0px; TOP: 13px; LEFT: 6px" id="Image1" src="Conzerv/Logo.jpg"/> 

        <p><img style="POSITION: absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 1000px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 62px; BORDER-LEFT-WIDTH: 0px; TOP: 79px; LEFT: 0px" id="Image3" src="Conzerv/Report-Page.jpg"/> 
            <img style="POSITION: absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 365px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 37px; BORDER-LEFT-WIDTH: 0px; TOP: 170px; LEFT: 632px" id="Image4" src="Conzerv/Entere.jpg"/>  
        </p>

        <div style="top:205px;left:670px;position:absolute;width:300px;height:200px;">
            <asp:TextBox ID="SNlist" runat="server" TextMode="MultiLine" Font-Names="Arial" Height="160px" Width="250px" Rows="10" onclienttextchanged="CheckLength(this,10);"></asp:TextBox>
        </div>

        <div style="POSITION: absolute; top:179px;left:52px;position:absolute;width:400px;height:200px;">
                <asp:CheckBox ID="Common" runat="server" Text=" Calibration Certification" Checked="True" /><br/>
            <p>&nbsp</p>
            <br/>

                <asp:CheckBox ID="Russia" runat="server" Text=" Acceptance Certification for Russia" />
        </div>

<%--        <asp:ImageButton style="position:absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 101px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 31px; BORDER-LEFT-WIDTH: 0px; TOP: 400px; LEFT: 702px" ImageUrl="Conzerv/submit.jpg" ID="ImageButton1" runat="server" Text="Submit" OnClick="submit_Click" OnClientClick="return Check(SNlist,10)" />--%>

        <p> 
            <%--<a style="POSITION: absolute; FONT-STYLE: normal; WIDTH: 86px; FONT-FAMILY: Arial; HEIGHT: 19px; COLOR: #33cc33; TOP: 17px; FONT-WEIGHT: bold; TEXT-DECORATION: none; LEFT: 800px" id="lnklogout0" href="Login.aspx">&gt; Log Out</a>--%> 
            <asp:LinkButton ID="lnk_Out" runat="server" OnClick="lnkOut_Click" style="position: absolute; font-style: normal;width: 86px; font-family: Arial; height: 19px; color: #33cc33; top: 17px; font-weight: bold;text-decoration: none; left: 895px;" >&gt; Log Out</asp:LinkButton>
        </p>
        <%--<img style="POSITION: absolute; BORDER-RIGHT-WIDTH: 0px; WIDTH: 141px; BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; HEIGHT: 21px; BORDER-LEFT-WIDTH: 0px; TOP: 761px; LEFT: 136px" id="Image5" src="Conzerv/copyright.jpg"/>--%> 
        <span style="border-style: none; POSITION: absolute; WIDTH: 600px; DISPLAY: inline-block; FONT-FAMILY: Arial; HEIGHT: 19px; COLOR: #009b3e; FONT-SIZE: medium; TOP: 320px; RIGHT: 688px; FONT-WEIGHT: bold; LEFT: 0px" id="LBLLBL">To find the Meter Serial Number,click</span> 
        <p><a style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 69px; FONT-FAMILY: Arial; HEIGHT: 19px; COLOR: #2fb4e9; TOP: 320px; FONT-WEIGHT: bold; TEXT-DECORATION: none; LEFT: 350px" id="btnInfo1"  href="javascript:ShowInfo('iEM2000');"><u>iEM2000</u></a> 
            <a style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 89px; FONT-FAMILY: Arial; HEIGHT: 19px; COLOR: #2fb4e9; TOP: 320px; FONT-WEIGHT: bold; TEXT-DECORATION: none; LEFT: 440px" id="btnInfo2"  href="javascript:ShowInfo('iEM3000');"><u>iEM3000</u></a> 
            <a style="POSITION: absolute; TEXT-ALIGN: center; WIDTH: 89px; FONT-FAMILY: Arial; HEIGHT: 19px; COLOR: #2fb4e9; TOP: 320px; FONT-WEIGHT: bold; TEXT-DECORATION: none; LEFT: 530px" id="btnInfo3"  href="javascript:ShowInfo('PM3000');"><u>PM3000</u></a> 
        </p>
    </form>
        <asp:Image ID="Image8" runat="server" ImageUrl="~/Conzerv/copyright.jpg" 
        
    style="bottom:6px; left: 0px; position: absolute; height: 60px; width: 1000px" />
        </asp:Panel>
</body>
    </html>
