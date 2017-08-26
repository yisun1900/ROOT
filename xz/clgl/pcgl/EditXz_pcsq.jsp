<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String yhmc=(String)session.getAttribute("yhmc");
%>
<%
String lrr=(String)session.getAttribute("yhmc");

String sqxh=null;
String dwbh=null;
String sqrq=null;
String ycsj=null;
String ycsj1=null;
String ycsj2=null;

String mdd=null;
String ycsy=null;
String sqr=null;
String lxfs=null;
String fhsj=null;
String fhsj1=null;
String fhsj2=null;
String gls=null;
String bz=null;
String sjxm=null;
String qcph=null;
String pzr=null;
String pzsj=null;
String wheresqxh=cf.GB2Uni(request.getParameter("sqxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select sqxh,dwbh,sqrq,ycsj,mdd,ycsy,sqr,lxfs,gls,fhsj,bz,qcph,pzr,pzsj,sjxm ";
	ls_sql+=" from  xz_pcsq";
	ls_sql+=" where  (sqxh='"+wheresqxh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sqxh=cf.fillNull(rs.getString("sqxh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		ycsj=cf.fillNull(rs.getString("ycsj"));
		mdd=cf.fillNull(rs.getString("mdd"));
		ycsy=cf.fillNull(rs.getString("ycsy"));
		sqr=cf.fillNull(rs.getString("sqr"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		gls=cf.fillNull(rs.getString("gls"));
		fhsj=cf.fillNull(rs.getString("fhsj"));
		bz=cf.fillNull(rs.getString("bz"));
		qcph=cf.fillNull(rs.getString("qcph"));
		pzr=cf.fillNull(rs.getString("pzr"));
		pzsj=cf.fillNull(rs.getDate("pzsj"));
		sjxm=cf.fillNull(rs.getString("sjxm"));

		ycsj1=ycsj.substring(11,13);
		ycsj2=ycsj.substring(14,16);
		fhsj1=fhsj.substring(11,13);
		fhsj2=fhsj.substring(14,16);

	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">派车申请－维护</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditXz_pcsq.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>申请部门              </td>
              <td width="32%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx  where dwbh='"+dwbh+"'","");
%> 
                </select>              </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>申请日期              </td>
              <td width="32%"> 
              <input type="text" name="sqrq" size="20" maxlength="10"  value="<%=sqrq%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>申请人              </td>
              <td width="32%"> 
                <input type="text" name="sqr" size="20" maxlength="8"  value="<%=sqr%>" >              </td>
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>联系方式              </td>
              <td width="32%"> 
              <input type="text" name="lxfs" size="20" maxlength="8"  value="<%=lxfs%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
                <span class="STYLE1">*</span>用车事由              </td>
              <td colspan="3"> 
                <textarea name="ycsy" cols="71" rows="3" ><%=ycsy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>目的地</p>              </td>
              <td width="32%"> 
                <input type="text" name="mdd" size="20" maxlength="20"  value="<%=mdd%>" >              </td>
              <td width="18%"> 
              <p align="right">公里数</p>              </td>
              <td width="32%"> 
              <input type="text" name="gls" size="20" maxlength="8"  value="<%=gls%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>用车时间</td>
              <td colspan="3"> 日期： 
                <input type="text" name="ycsj" size="10" maxlength="10"  value="<%=ycsj.substring(0,10)%>" onDblClick="JSCalendar(this)">
                小时：
                <select name="ycsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"08+8时&09+9时&10+10时&11+11时&12+12时&13+13时&14+14时&15+15时&16+16时&17+17时&18+18时&19+19时&20+20时&21+21时&22+22时&23+24时&0+0时&1+1时&2+2时&3+3时&4+4时&5+5时&6+6时&7+7时",ycsj1);
%>
                </select> 
                
                分钟：
                <select name="ycsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"10+10分&20+20分&30+30分&40+40分&50+50分",ycsj2);
%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <p align="right"><span class="STYLE1">*</span>返回时间              </td>
              <td colspan="3"> 日期： 
                <input type="text" name="fhsj" size="10" maxlength="10"  value="<%=fhsj.substring(0,10)%>" onDblClick="JSCalendar(this)">
                小时：
                <select name="fhsj1" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
<%
	cf.selectToken(out,"08+8时&09+9时&10+10时&11+11时&12+12时&13+13时&14+14时&15+15时&16+16时&17+17时&18+18时&19+19时&20+20时&21+21时&22+22时&23+24时&0+0时&1+1时&2+2时&3+3时&4+4时&5+5时&6+6时&7+7时",fhsj1);
%>
                </select> 
                
                分钟：
                <select name="fhsj2" style="FONT-SIZE:12PX;WIDTH:52PX">
                  <option value=""></option>
 <%
	cf.selectToken(out,"10+10分&20+20分&30+30分&40+40分&50+50分",fhsj2);
%>
                </select></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%"><font color="#0000FF">录入人</font></td>
              <td width="32%"> 
                <input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>              </td>
              <td align="right" width="18%"><font color="#0000FF">录入时间</font></td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                 
            <input type="hidden" name="wheresqxh"  value="<%=wheresqxh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
               
              <input type="reset"  value="重输"></td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[申请部门]！");
		FormName.dwbh.focus();
		return false;
	}
		if(	javaTrim(FormName.sqr)=="") {
		alert("请输入[申请人]！");
		FormName.sqr.focus();
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("请输入[目的地]！");
		FormName.mdd.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("请输入[联系方式]！");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.ycsy)=="") {
		alert("请输入[用车事由 ]！");
		FormName.ycsy.focus();
		return false;
	}

	if(	javaTrim(FormName.sqrq)=="") {
		alert("请输入[申请日期]！");
		FormName.sqrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.sqrq, "申请日期"))) {
		return false;
	}
	if(	javaTrim(FormName.mdd)=="") {
		alert("请输入[目的地]！");
		FormName.mdd.focus();
		return false;
	}

	if(	javaTrim(FormName.ycsj)=="") {
		alert("请输入[用车日期]！");
		FormName.ycsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.ycsj, "用车日期"))) {
		return false;
	}
 	if(	javaTrim(FormName.ycsj1)=="") {
		alert("请输入[用车小时]！");
		FormName.ycsj1.focus();
		return false;
	}
 	if(	javaTrim(FormName.ycsj2)=="") {
		alert("请输入[用车分钟]！");
		FormName.ycsj2.focus();
		return false;
	}


	if(	javaTrim(FormName.fhsj)=="") {
		alert("请输入[返回时间]！");
		FormName.fhsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.fhsj, "返回时间"))) {
		return false;
	}
	if(	javaTrim(FormName.fhsj1)=="") {
		alert("请输入[返回小时]！");
		FormName.fhsj1.focus();
		return false;
	}
	if(	javaTrim(FormName.fhsj2)=="") {
		alert("请输入[返回分钟]！");
		FormName.fhsj2.focus();
		return false;
	}



	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	if(!(isFloat(FormName.gls, "公里数"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
