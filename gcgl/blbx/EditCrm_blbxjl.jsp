<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>修改</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String dwbh=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgbz=null;

String kbxbz=null;
String bxlbbm=null;
String bxkssj=null;
String bxjzsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String bxsm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

int row=0;
String bgcolor=null;

try {
	conn=cf.getConnection();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,a.dwmc dm,zjxm,sgdmc sgd,sgbz,sjkgrq,sjjgrq";
	ls_sql+=" from  crm_khxx,sq_dwxx a,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and  crm_khxx.khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwmc=cf.fillNull(rs.getString("dm"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();


	ls_sql="select kbxbz,bxlbbm,bxkssj,bxjzsj,lrr,lrsj,lrbm,bxsm ";
	ls_sql+=" from  crm_blbxjl";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxlbbm=cf.fillNull(rs.getString("bxlbbm"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		bxsm=cf.fillNull(rs.getString("bxsm"));
	}
	rs.close();
	ps.close();
%>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">修改保修信息</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"> 
                客户编号              </td>
              <td width="32%"> <%=khbh%> </td>
              <td width="18%" align="right"> 
                合同号              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF"> 
                客户姓名              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=khxm%> </td>
              <td width="18%" bgcolor="#CCCCFF">&nbsp;</td>
              <td width="32%" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="32%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">工程签约额</td>
              <td width="32%" bgcolor="#CCCCFF"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">装修设计师</td>
              <td width="32%"><%=sjs%></td>
              <td width="18%" align="right">工程担当</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">施工队</td>
              <td width="32%"><%=sgd%></td>
              <td width="18%" align="right">施工班组</td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">应开工日期</td>
              <td width="32%"><%=kgrq%></td>
              <td width="18%" align="right">应竣工日期</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">实际开工日期</td>
              <td width="32%"><%=sjkgrq%></td>
              <td width="18%" align="right">实际竣工日期</td>
              <td width="32%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1 STYLE3 STYLE1">*</span>可保修标志</td>
              <td><%
	cf.radioToken(out, "kbxbz","Y+保修&N+不保修",kbxbz);
%>              </td>
              <td align="right">保修类别</td>
              <td><select name="bxlbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select bxlbbm,bxlbmc from crm_bxlbbm order by bxlbbm",bxlbbm);
%>
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">保修开始时间</td>
              <td><input type="text" name="bxkssj" size="20" maxlength="10"  value="<%=bxkssj%>" onDblClick="JSCalendar(this)">              </td>
              <td align="right">保修截止时间</td>
              <td><input type="text" name="bxjzsj" size="20" maxlength="10"  value="<%=bxjzsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">保修说明</td>
              <td colspan="3"><textarea name="bxsm" cols="71" rows="3"><%=bxsm%></textarea></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><span class="STYLE1 STYLE3 STYLE1">*</span><span class="STYLE2">录入人</span></td>
              <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
              <td align="right"><span class="STYLE1 STYLE3">*</span><span class="STYLE2">录入时间</span></td>
              <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#FFFFFF"><span class="STYLE1 STYLE3 STYLE1">*</span><span class="STYLE2">录入部门</span></td>
              <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'","");
%>
                </select>              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
        </table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="5%">序号</td>
      <td width="6%">选择保修项目</td>
	<td width="35%">项目名称（<font color="#FF0000"><b>打勾代表保修，不打勾不保修</b></font>）</td>
      <td width="54%">情况说明</td>
    </tr>
<%
	String bxxm=null;
	String xmsm=null;

	ls_sql="SELECT bxxm,xmsm";
	ls_sql+=" FROM crm_bxxmbm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bxxm=rs.getString("bxxm");
		xmsm=rs.getString("xmsm");

		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT sfbx,qksm";
		ls_sql+=" FROM crm_khbxxm";
		ls_sql+=" where khbh='"+khbh+"' and bxxm='"+bxxm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfbx=rs1.getString("sfbx");
			qksm=cf.fillNull(rs1.getString("qksm"));
		}
		rs1.close();
		ps1.close();

		if (sfbx.equals(""))
		{
			mark="checked";
		}
		else if (sfbx.equals("Y"))
		{
			mark="checked";
		}
		else{
			mark="";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td><%=row%></td>
		  <td>
			<input name="xzbxxm" type="checkbox" value="<%=bxxm%>" <%=mark%>>
		  </td>
		  <td><%=bxxm%>
			<input type="hidden" name="bxxm" value="<%=bxxm%>">
		</td>
		  <td>
			<input type="text" name="qksm" value="<%=qksm%>" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		</td>
		</tr>
		<%
	}
	rs.close();
	ps.close();
%>
        </table>
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px' bgcolor="#999999">

            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input name="dy" type="button" onClick="window.open('dybxd.jsp?khbh=<%=khbh%>')"  value="打印"  >
                <input type="reset"  value="重输" name="reset">
              </td>
            </tr>
        </table>

	  </form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<%
	
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.kbxbz)) {
		alert("请选择[可保修标志]！");
		FormName.kbxbz[0].focus();
		return false;
	}

	if (FormName.kbxbz[0].checked )
	{
		if(	javaTrim(FormName.bxlbbm)=="") {
			alert("请输入[保修类别]！");
			FormName.bxlbbm.focus();
			return false;
		}
		if(	javaTrim(FormName.bxkssj)=="") {
			alert("请输入[保修开始时间]！");
			FormName.bxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxkssj, "保修开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.bxjzsj)=="") {
			alert("请输入[保修截止时间]！");
			FormName.bxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
			return false;
		}

		var choo=1;

		var i = 0;
		if (<%=row%>==1){
			if( FormName.xzbxxm.checked ){
				choo=1;
			}
			else{
				choo=0;
			}
		} 
		else if (<%=row%> > 1)
		{
			choo=0;
			for (i=0;i <<%=row%>;i++ ){
				if( FormName.xzbxxm[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择【保修项目】");
			return false;
		}
	
	}
	else{
		FormName.bxlbbm.value="";
		FormName.bxkssj.value="";
		FormName.bxjzsj.value="";

		if(	javaTrim(FormName.bxsm)=="") {
			alert("请选择[保修说明]！");
			FormName.bxsm.focus();
			return false;
		}
	}

	FormName.action="SaveEditCrm_blbxjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
