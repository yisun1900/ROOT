<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">

<%
String yhmc=(String)session.getAttribute("yhmc");
String skdw=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
int count=0;

String khxm="";
String fwdz="";
String lxfs="";
String sjs="";
String qye="";
String hth="";
String dwbh="";
String sgd="";
String zjxm="";
String qyrq="";
String zt="";

String sjsbh=null;
String fgsbh=null;
String sjfkzc=null;
String dsksjbz="";
double glf=0;
double sjf=0;

String cxhdbm="";
String sffj="";
double fjje=0;
double gsfje=0;
String sfyrz="";
String rzsc="";
String sfyyh="";
String yhyy="";

String zcmmbz="";//主材收款检查
String mmbz="";//木门收款检查
String cgjjbz="";//橱柜收款检查
String jjbz="";//家具收款检查


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String fkxh="";
try {
	conn=cf.getConnection();

	ls_sql="select khxm,fwdz,lxfs,sjs,zxdm,ssfgs,sjsbh,sjfkzc,cxhdbm,DECODE(zxzt,'0','未分配店面','1','分配店面','2','设计师提交飞单','3','已签约','4','飞单','5','飞单审核未通过') zt";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zt="咨询客户（"+cf.fillNull(rs.getString("zt"))+"）";
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("zxdm"));
		fgsbh=cf.fillNull(rs.getString("ssfgs"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjfkzc=cf.fillNull(rs.getString("sjfkzc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
	}
	rs.close();
	ps.close();


	if (fgsbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">错误！所属分公司为空</font>");
		return;
	}
	if (dwbh.equals(""))
	{
		out.println("<font color=\"#FF0000\">错误！所属店面为空</font>");
		return;
	}





		%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">订单编号</td>
		<td  width="9%">处理状态</td>
		<td  width="14%">品牌</td>
		<td  width="6%">材料顾问</td>

		<td  width="6%">项目专员</td>
		<td  width="9%">合同总额</td>
		<td  width="9%">增减项金额</td>
		<td  width="9%">录入时间</td>
		<td  width="6%">录入人</td>
		<td  width="16%">备注</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT jc_zcdd.ddbh,clztmc,ppbm,jc_zcdd.clgw,jc_zcdd.xmzy,jc_zcdd.hkze,jc_zcdd.zjhze,jc_zcdd.lrsj,jc_zcdd.lrr,jc_zcdd.bz";
		ls_sql+=" FROM jc_zcdd,jdm_zcddzt";
		ls_sql+=" where jc_zcdd.khbh='"+khbh+"'";
		ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+)";
		ls_sql+=" order by jc_zcdd.zcdlbm,jc_zcdd.ppbm,jc_zcdd.ddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
		//设置显示列
	String[] disColName={"clgw"};
	pageObj.setDisColName(disColName);

	%>
	</table>
		<%


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">把主材订单从一个客户名下转到另一个客户名下</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF">
              <td height="47" colspan="4" align="center">转出客户信息</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right">客户编号</td>
              <td width="31%"><%=khbh%></td>
              <td width="19%" align="right">合同号</td>
              <td width="31%"><%=hth%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                客户姓名              </td>
              <td width="31%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="19%" align="right">设计师</td>
              <td width="31%"><%=sjs%>（<%cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);%>）</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="19%" align="right"> 
                房屋地址              </td>
              <td width="31%"><%=fwdz%> </td>
              <td width="19%" align="right"> 
                客户类型              </td>
              <td width="31%"><%=zt%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td height="45" colspan="4" align="center">转入客户信息</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>分公司</td>
              <td>
				<select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
			  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%>
				</select>
				</td>
              <td align="right">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>转入客户编号</td>
              <td width="31%"> 
                <input type="text" name="khbh" value="" size="20" maxlength="7" >              </td>
              <td width="19%" align="right"><font color="#FF0000">*</font>转入客户姓名 </td>
              <td width="31%"> 
                <input type="text" name="khxm" value="" size="20" maxlength="50" >              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"><input type="hidden" name="khbh2"  value="<%=khbh%>" >
              <input type="button" name="bc" value="开始转移" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">
                <input type="button" value="查看收款信息" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')"  ></td>
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
	if ( confirm("确实要继续吗?") )	
	{
		if(	javaTrim(FormName.fgsbh)=="") {
			alert("请输入[分公司]！");
			FormName.fgsbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khbh)=="") {
			alert("请输入[转入客户编号]！");
			FormName.khbh.focus();
			return false;
		}
		if(	javaTrim(FormName.khxm)=="") {
			alert("请输入[转入客户姓名]！");
			FormName.khxm.focus();
			return false;
		}
		if(	FormName.khbh.value==FormName.khbh2.value) {
			alert("错误！转入、转出客户不能相同");
			FormName.khbh.focus();
			return false;
		}

		FormName.action="SaveDdzyJc_zcdd.jsp";
		FormName.submit();
		return true;
	}
}

//-->
</SCRIPT>
