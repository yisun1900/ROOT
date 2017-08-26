<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrdw=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zt=request.getParameter("zt");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String khjl=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dwbh=null;
String dwmc=null;
String cxhdbm=null;
String gcjdbm="";
String zxdjbm=null;

String yddbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String ssfgs=null;
String xmzy="";

String listSql="";
String jjwjbz="";

int count=0;

try {
	conn=cf.getConnection();

	if (zt.equals("2"))//2:家装客户;4:非家装客户
	{
		ls_sql="select fgsbh,xmzy,khxm,fwdz,lxfs,hth,khjl,sjs,qye,kgrq,jgrq,crm_khxx.dwbh,dwmc,cxhdbm,gcjdbm,crm_khxx.jjwjbz";
		ls_sql+=" from  sq_dwxx,crm_khxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ssfgs=rs.getString("fgsbh");
			xmzy=cf.fillNull(rs.getString("xmzy"));
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			hth=cf.fillNull(rs.getString("hth"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			qye=cf.fillNull(rs.getString("qye"));
			kgrq=cf.fillNull(rs.getDate("kgrq"));
			jgrq=cf.fillNull(rs.getDate("jgrq"));
			dwbh=cf.fillNull(rs.getString("dwbh"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
			jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		}
		rs.close();
		ps.close();
	}
	else
	{
		ls_sql="select khxm,fwdz,lxfs,khjl,sjs,crm_zxkhxx.ssfgs,crm_zxkhxx.zxdm,dwmc,cxhdbm,zxdjbm";
		ls_sql+=" from  sq_dwxx,crm_zxkhxx";
		ls_sql+=" where crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and  (crm_zxkhxx.khbh='"+khbh+"')  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			khxm=cf.fillNull(rs.getString("khxm"));
			fwdz=cf.fillNull(rs.getString("fwdz"));
			lxfs=cf.fillNull(rs.getString("lxfs"));
			khjl=cf.fillNull(rs.getString("khjl"));
			sjs=cf.fillNull(rs.getString("sjs"));
			ssfgs=cf.fillNull(rs.getString("ssfgs"));
			dwbh=cf.fillNull(rs.getString("zxdm"));
			dwmc=cf.fillNull(rs.getString("dwmc"));
			cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
			zxdjbm=cf.fillNull(rs.getString("zxdjbm"));

		}
		rs.close();
		ps.close();

		if (dwbh.equals(""))
		{
			ls_sql="select dwbh,dwmc";
			ls_sql+=" from  sq_dwxx";
			ls_sql+=" where dwbh='"+zxdjbm+"' ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				dwbh=cf.fillNull(rs.getString("dwbh"));
				dwmc=cf.fillNull(rs.getString("dwmc"));

			}
			rs.close();
			ps.close();
		}
	}


	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再录入订单");
		return;
	}

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}


	ls_sql="select NVL(max(substr(yddbh,8,2)),0)";
	ls_sql+=" from  jc_mmydd";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	yddbh=khbh+cf.addZero(count+1,2);

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
<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="8%">预订单编号</td>
	<td  width="11%">处理状态</td>
	<td  width="7%">项目专员</td>
	<td  width="7%">驻店家居顾问</td>
	<td  width="7%">展厅家居顾问</td>
	<td  width="10%">派单工厂</td>
	<td  width="9%">合同金额</td>
	<td  width="9%">增减后总额</td>
	<td  width="9%">五金情况</td>
	<td  width="9%">录入时间</td>
	<td  width="14%">录入部门</td>
	</tr>
	<%
		ybl.common.PageObject pageObj=new ybl.common.PageObject();
		ls_sql="SELECT yddbh,clztmc,jc_mmydd.xmzy,jc_mmydd.clgw,jc_mmydd.ztjjgw,pdgcmc,jc_mmydd.htje,jc_mmydd.zjhze,DECODE(jc_mmydd.wjqk,'1','客户自购','2','公司购买') wjqk,jc_mmydd.lrsj,a.dwmc lrdw ";
		ls_sql+=" FROM crm_khxx,jc_mmydd,sq_dwxx a,jdm_mmyddzt ";
		ls_sql+=" where jc_mmydd.dwbh=a.dwbh(+) and jc_mmydd.khbh=crm_khxx.khbh(+)";
		ls_sql+=" and jc_mmydd.clzt=jdm_mmyddzt.clzt(+)";
		ls_sql+=" and jc_mmydd.khbh='"+khbh+"'";
		ls_sql+=" order by lrsj desc,yddbh";
		pageObj.sql=ls_sql;
		pageObj.initPage("","","","");
		pageObj.setPageRow(1000);//设置每页显示记录数
		pageObj.out=out;
		pageObj.getDate(1);

		pageObj.displayDate();
	%>
	</table>
	<%
}
%>
<table width="100%">
  <tr>
    <td width="100%"> 
       <div align="center">木门预订单（订单编号：<%=yddbh%>）<font color="#FF0000">
         <%if (count>0) out.print("注意:该客户已有木门订单");%>
         </font>
       </div></td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                客户编号              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                合同号              </td>
              <td width="30%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="20%" align="right">房屋地址</td>
              <td width="30%"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="20%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="30%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#CCCCFF"> 
                家装签约额              </td>
              <td width="31%" bgcolor="#CCCCFF"><%=qye%> </td>
              <td width="20%" align="right" bgcolor="#CCCCFF"> 
                合同开工日期              </td>
              <td width="30%" bgcolor="#CCCCFF"><%=kgrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">实际开工日期</td>
              <td width="31%">&nbsp;</td>
              <td width="20%" align="right">合同竣工日期</td>
              <td width="30%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td colspan="3"> <%=cxhdbm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                五金情况              </td>
              <td width="31%"> 
                <input type="radio" name="wjqk"  value="1">
                客户自购 
                <input type="radio" name="wjqk"  value="2">
                公司购买 </td>
              <td width="20%" align="right"> 
                木门订金              </td>
              <td width="30%"> 
                <input type="text" name="sqdj" value="0" size="20" maxlength="9" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>驻店家居顾问</td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,yhmc);
%> 
                </select>              </td>
              <td width="20%" align="right"><font color="#FF0000">*</font>展厅家居顾问</td>
              <td width="30%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" UNION ALL ";
	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N') ";
	listSql+=" ORDER BY c2 ";
	cf.selectItem(out,listSql,yhmc);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
				if (xmzy.equals(""))
				{
					out.println("<option value=\"\"></option>");

					listSql=" select sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N')";
					listSql+=" UNION ALL ";
					listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc c2 from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N')";
					listSql+=" ORDER BY c2 ";
					cf.selectItem(out,listSql,"");
				}
				else{
					out.println("<option value=\""+xmzy+"\">"+xmzy+"</option>");
				}
				%> 
                </select>              </td>
              <td width="20%" align="right">计划初测时间</td>
              <td width="30%"> 
                <input type="text" name="jhccsj" value="" size="20" maxlength="10" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"> 
                录入人              </td>
              <td width="31%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="20%" align="right"> 
                录入时间              </td>
              <td width="30%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">录入部门</td>
              <td width="31%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'","");
%> 
                </select>              </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="hidden" name="zt" value="<%=zt%>">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="yddbh" value="<%=yddbh%>" >
                  <input type="hidden" name="fgsbh" value="<%=ssfgs%>" >
                  <input type="hidden" name="qddm" value="<%=dwbh%>" >
                  <input type="hidden" name="khjl" value="<%=khjl%>" >
                  <input type="hidden" name="jzsjs" value="<%=sjs%>" >
                  <input type="button"  value="存盘" onClick="f_do(insertform)">
                  <input type="reset"  value="重输" name="reset">
                  <input type="button" value="打印预订单" onClick="window.open('/jcjj/dygl/dyydd.jsp?lx=mm&ddbh=<%=yddbh%>&khbh=<%=khbh%>')" name="dy" disabled>
                </p>                </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
/*
	if(	!radioChecked(FormName.wjqk)) {
		alert("请选择[五金情况]！");
		FormName.wjqk[0].focus();
		return false;
	}

	if(	javaTrim(FormName.sqdj)=="") {
		alert("请输入[收取定金]！");
		FormName.sqdj.focus();
		return false;
	}
*/
	if(	javaTrim(FormName.clgw)=="") {
		alert("请输入[驻店家居顾问]！");
		FormName.clgw.focus();
		return false;
	}
	if(	javaTrim(FormName.ztjjgw)=="") {
		alert("请输入[展厅家居顾问]！");
		FormName.ztjjgw.focus();
		return false;
	}
	if(!(isFloat(FormName.sqdj, "收取定金"))) {
		return false;
	}
	if(	javaTrim(FormName.xmzy)=="") {
		alert("错误！没有[项目专员]！");
		FormName.xmzy.focus();
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
	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[录入部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhccsj, "计划初测时间"))) {
		return false;
	}

	FormName.action="SaveInsertJc_mmydd.jsp";
	FormName.submit();
	FormName.dy.disabled=false;
	return true;
}

function f_end(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="EndJc_mmydd.jsp";
	FormName.submit();
	return true;
}

function f_lrmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="InsertJc_mmydmx.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("请输入[预订单编号]！");
		FormName.yddbh.focus();
		return false;
	}

	FormName.action="Jc_mmydmxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>

