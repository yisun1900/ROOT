<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");


String ddbh=request.getParameter("ddbh");
String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String dqbm=null;
String fgsbh=null;
String htqrr=null;
String htqrsj=null;
String htqrbz=null;

double gtbfje =0;
double tmbfje =0;
double wjhtze=0;
double dqhtze=0;
double htze=0;

double zqgtbfje =0;
double zqtmbfje =0;
double zqwjhtze=0;
double zqdqhtze=0;
double wdzje=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;


double cgzkl=0;
double tmzkl=0;
double wjzkl=0;
double dqzkl=0;
String dzyy=null;

double yfkze=0;
double cgfk=0;
int yfksl=0;
String mark="";

try {
	conn=cf.getConnection();

	ls_sql="select khbh,htqrr,htqrsj,htqrbz,fgsbh";
	ls_sql+=" ,jc_cgdd.gtbfje,jc_cgdd.tmbfje,jc_cgdd.wjhtze,jc_cgdd.dqhtze,jc_cgdd.htze ";
	ls_sql+=" ,jc_cgdd.zqgtbfje,jc_cgdd.zqtmbfje,jc_cgdd.zqwjhtze,jc_cgdd.zqdqhtze,jc_cgdd.wdzje ";
	ls_sql+=" ,jc_cgdd.cgzkl,jc_cgdd.tmzkl,jc_cgdd.wjzkl,jc_cgdd.dqzkl,jc_cgdd.dzyy ";
	ls_sql+=" from  jc_cgdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		htqrr=cf.fillNull(rs.getString("htqrr"));
		htqrsj=cf.fillNull(rs.getDate("htqrsj"));
		htqrbz=cf.fillNull(rs.getString("htqrbz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));

		gtbfje=rs.getDouble("gtbfje");
		tmbfje=rs.getDouble("tmbfje");
		wjhtze=rs.getDouble("wjhtze");
		dqhtze=rs.getDouble("dqhtze");
		htze=rs.getDouble("htze");

		zqgtbfje=rs.getDouble("zqgtbfje");
		zqtmbfje=rs.getDouble("zqtmbfje");
		zqwjhtze=rs.getDouble("zqwjhtze");
		zqdqhtze=rs.getDouble("zqdqhtze");
		wdzje=rs.getDouble("wdzje");

		cgzkl=rs.getDouble("cgzkl");
		tmzkl=rs.getDouble("tmzkl");
		wjzkl=rs.getDouble("wjzkl");
		dqzkl=rs.getDouble("dqzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
	}
	rs.close();
	ps.close();

	ls_sql="select hth,khxm,fwdz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillHtml(rs.getString("hth"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+fgsbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

	//家居预付款
	ls_sql="SELECT sum(cw_khfkjl.fkje)";
	ls_sql+=" FROM cw_khfkjl  ";
	ls_sql+=" where cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfkze=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where ddbh='"+ddbh+"' and scbz='N' and fklxbm='22'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cgfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	if ( cgfk < (htze-11))
	{
		if ( yfkze < (htze-11-cgfk))
		{
			mark="1";//预付款不足，退出
		}
		else{
			mark="2";//付款不足,需预付款转换
		}
	}
%>

<html>
<head>
<title>交款确认</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" >

        <div align="center">橱柜订单处理－交款确认（订单编号：<%=ddbh%>）</div>
        
          <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">柜体合同金额-折前</font></td>
              <td><%=zqgtbfje%></td>
              <td align="center"><font color="#000099">柜体折扣率</font><%=cgzkl%></td>
              <td align="right"><font color="#000099">柜体合同金额-折后</font></td>
              <td><%=gtbfje%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">台面合同金额-折前</font></td>
              <td><%=zqtmbfje%></td>
              <td align="center"><font color="#000099">台面折扣率<%=tmzkl%></font></td>
              <td align="right"><font color="#000099">台面合同金额-折后</font></td>
              <td><%=tmbfje%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">五金合同总额-折前</font></td>
              <td><%=zqwjhtze%></td>
              <td align="center"><font color="#000099">五金折扣率<%=wjzkl%></font></td>
              <td align="right"><font color="#000099">五金合同总额-折后</font></td>
              <td><%=wjhtze%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#000099">电器合同总额-折前</font></td>
              <td><%=zqdqhtze%></td>
              <td align="center"><font color="#000099">电器折扣率<%=dqzkl%></font></td>
              <td align="right"><font color="#000099">电器合同总额-折后</font></td>
              <td><%=dqhtze%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099"><b>未打折金额</b></font></td>
              <td width="21%"><%=wdzje%></td>
              <td width="20%" align="center">&nbsp;</td>
              <td width="19%" align="right"><font color="#000099"><b>合同总额</b></font></td>
              <td width="22%"><%=htze%></td>
            </tr>
			
			<tr bgcolor="#FFFFFF">
			  <td align="right" bgcolor="#FFFFFF"><font color="#000099">打折原因</font></td>
			  <td colspan="4"><%=dzyy%></td>
			</tr>


  </TABLE>

<%
	  if (mark.equals("1") || mark.equals("2"))
	  {
%>
  
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td colspan="4" align="center" bgcolor="#FFFFCC" ><strong><font color="#FF0000">提醒！付款不足，需用预付款转出！</font></strong></td>
	</tr>
    <tr bgcolor="#FFFFFF">
      <td colspan="2" rowspan="5" align="center" valign="top" >


<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
  <tr bgcolor="#CCCCCC"  align="center"> 
	<td  width="10%">&nbsp;</td>
	<td  width="45%">可用预付款</td>
	<td  width="45%">可用金额</td>
  </tr>
  <%
	String fklxbm=null;
	String fklxmc=null;
	double fkje=0;

	ls_sql="SELECT cw_khfkjl.fklxbm,cw_fklxbm.fklxmc,sum(cw_khfkjl.fkje) fkje";
	ls_sql+=" FROM cw_khfkjl,cw_fklxbm";
	ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+) ";
	ls_sql+=" and cw_khfkjl.khbh='"+khbh+"' and scbz='N' ";
	ls_sql+=" and cw_khfkjl.fklxbm in('62','63','64','65')";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ls_sql+=" group by cw_khfkjl.fklxbm,cw_fklxbm.fklxmc";
	ls_sql+=" having sum(cw_khfkjl.fkje)!=0 ";
	ls_sql+=" order by sum(cw_khfkjl.fkje) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		fklxbm=rs.getString("fklxbm");
		fklxmc=cf.fillHtml(rs.getString("fklxmc"));
		fkje=rs.getDouble("fkje");

		yfksl++;

		%> 
		  <tr bgcolor="#FFFFFF"  align="center"> 
			<td>
				<input name="fklxbm" type="checkbox" value="<%=fklxbm%>">			</td>
			<td><%=fklxmc%></td>
			<td align="right"><%=cf.formatDouble(fkje)%>
				<input name="fkje" type="hidden" value="<%=fkje%>">			</td>
		  </tr>
		<%
	}
	rs.close();
	ps.close();

	%> 
</table>	  </td>
      <td width="18%" align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订货金额</font></b></td>
      <td width="32%" bgcolor="#FFFFCC"><%=cf.round(htze,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><b><font color="#0000FF">订单已付款</font></b></td>
      <td bgcolor="#FFFFCC"><%=cgfk%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">应补交货款</font></strong></td>
      <td bgcolor="#FFFFCC"><%=cf.round(htze-cgfk,2)%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><strong><font color="#0000FF">可用预付款</font></strong></td>
      <td bgcolor="#FFFFCC"><%=yfkze%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0000">*</font>预付款转出额</td>
      <td bgcolor="#FFFFCC"><input type="text" name="sfkje" size="20" maxlength="20" value="<%=cf.round(htze-cgfk,2)%>"></td>
    </tr>
  </TABLE>

<%
	}
	else{
		%>
	<BR>	 
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">家居预付款</font></b></td>
      <td width="21%" bgcolor="#FFFFFF"><%=yfkze%></td>
      <td width="21%" align="center" bgcolor="#FFFFFF"><font color="#CC0033"><strong>欠款：<%=cf.round(htze-cgfk,2)%></strong></font></td>
      <td width="18%" align="right" bgcolor="#FFFFFF"><b><font color="#0000FF">订单已付款</font></b></td>
      <td width="22%" bgcolor="#FFFFFF"><%=cgfk%><input type="hidden" name="sfkje" value="0"></td>
    </tr>
  </TABLE>
		<%
	}
		
%>

	<BR>	 

  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

             <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">客户编号</font></td>
              <td width="32%"><%=khbh%></td>
              <td width="18%" align="right"><font color="#000099">合同号</font></td>
              <td width="32%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="32%"><%=khxm%></td>
              <td width="18%" align="right"><font color="#000099">房屋地址</font></td>
              <td width="32%"><%=fwdz%></td>
            </tr>
           <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>交款确认人</td>
              <td width="32%"> 
              <input type="text" name="htqrr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>交款确认时间</td>
              <td width="32%"> 
              <input type="text" name="htqrsj" size="20" maxlength="20"  value="<%=cf.today()%>" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">交款确认说明</td>
              <td colspan="3"> 
                <textarea name="htqrbz" cols="71" rows="3"><%=htqrbz%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" align="right" > 
                <div align="center"> 
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset" name="Reset" value="重输">
                  <input type="hidden" name="ddbh"  value="<%=ddbh%>" >
                  <input type="button"  value="查看收款情况" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" name="button">
                </div>              </td>
            </tr>
          </table>


</form>


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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
<%
if (mark.equals("1") || mark.equals("2"))
{
	%>

	if(	javaTrim(FormName.sfkje)=="") {
		alert("付款不足，需用预付款转出！请输入[预付款转出额]！");
		FormName.sfkje.focus();
		return false;
	}
	if(!(isFloat(FormName.sfkje, "预付款转出额"))) {
		return false;
	}
	if (parseFloat(FormName.sfkje.value)< <%=(htze-cgfk-11)%> || parseFloat(FormName.sfkje.value)> <%=(htze-cgfk+11)%>)
	{
		if ( !confirm("提醒！[预付款转出额]小于[<%=cf.round(htze-cgfk-11,2)%>]，或大于[<%=cf.round(htze-cgfk+11,2)%>]！确实要继续吗?") )	
		{
			return false;
		}
	}

	
	
	var choo=0;
	var zkje=0;

	if (<%=yfksl%>==1)
	{
		if( FormName.fklxbm.checked )
		{
			choo=1;
			zkje=zkje+parseFloat(FormName.fkje.value);
		}
	} 
	else
	{ 
		for (var i=0;i <<%=yfksl%>;i++ )
		{
			if( FormName.fklxbm[i].checked )
			{
				choo=1;
				zkje=zkje+parseFloat(FormName.fkje[i].value);
			}
		} 
	} 

	if (zkje < parseFloat(FormName.sfkje.value) ){
		alert("转款不足，转款合计＝"+zkje+"，需转款＝"+parseFloat(FormName.sfkje.value));
		return false;
	}

	<%
}
%>
	if(	javaTrim(FormName.htqrr)=="") {
		alert("请输入[交款确认人]！");
		FormName.htqrr.focus();
		return false;
	}
	if(	javaTrim(FormName.htqrsj)=="") {
		alert("请输入[交款确认时间]！");
		FormName.htqrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.htqrsj, "交款确认时间"))) {
		return false;
	}

	FormName.action="SaveQrJc_cgdd.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
