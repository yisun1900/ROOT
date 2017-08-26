<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<style type="text/css">
<!--
.STYLE3 {font-size: 24px; font-weight: bold;}
-->
</style>
</head> 
<body> 
<object id='WebBrowser' width=0 height=0 classid='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'>
</object>

<%
String[] fkxh=request.getParameterValues("fkxh");//收据号码，流水号cw_khfkjl.fkxh 主键
String khbh=request.getParameter("khbh");

String fklxbm=null;//款项类型编码
String fklxmc=null;
String khxm=null;//客户名称
String hth=null;//客户档案号=客户合同号
String tempskxm=null;//临时收款项目，用来合成收款项目
String gysbh=null;//品牌名称
double skje=0;//收款金额 cw_khfkjl.fkje
String bz=null;//备注
double hjxx=0;//合计小写，暂时不用
String hjdx=null;//合计大写，暂时不用
String skr=null;//收款人
String jkr=null;//与客户名称相同
String skrq=null;//收款日期，从上页面传来的字符串

String sjs=null;//家装设计师，cw_khfkjl.sjs
//驻点材料顾问，根据四个不同的款项类型查四个不同的表。jc_jjdd.clgw,jc_cgdd.clgw,jc_zcdd.clgw,jc_mmydd.clgw
String clgw_o="&nbsp;";
//展厅家居顾问，根据四个不同的款项类型查四个不同的表。jc_jjdd.ztjjgw,jc_cgdd.ztjjgw,jc_zcdd.ztjjgw,jc_mmydd.ztjjgw
String ztjjgw="&nbsp;";
String clgw=null;//clgw_o+ztjjgw
//家居设计师。根据四个不同的款项类型查四个不同的表。jc_jjdd.jjsjs,jc_cgdd.jjsjs,jc_zcdd.jjsjs,jc_mmydd.jjsjs
String jjsjs="&nbsp;";
String dwmc=null;//店面名称
String fkcsmc=null;

String temppp="";
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

double allskje=0;

try {
	conn=cf.getConnection();

	int count=0;
	ls_sql="select count(distinct khbh)";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where "+cf.arrayToInSQL(fkxh,"fkxh");
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	if (count>1)
	{
		out.println("错误！不是同一客户收据");
		return;
	}

	ls_sql="select sksj,khbh";
	ls_sql+=" from cw_khfkjl";
	ls_sql+=" where fkxh='"+fkxh[0]+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		skrq=cf.fillNull(rs.getDate("sksj"));
		khbh=cf.fillNull(rs.getString("khbh"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,hth,dwmc,sjs";
	ls_sql+=" from crm_khxx,sq_dwxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		hth=cf.fillNull(rs.getString("hth"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjs=cf.fillNull(rs.getString("sjs"));
	}
	rs.close();
	ps.close();


%> 
  <table width="100%" border="0">
    <tr> 
      <td> 
      <table width="100%" border="0" align="center" style="FONT-SIZE:15" height="40">
        <tr valign="bottom"> 
          <td > 
            <table width="100%" border="0" align="center" style="FONT-SIZE:15" >
          
          <tr>
            <td height="25">合同编号：<u>&nbsp;<%=hth%>&nbsp;</u></td>
            <td align="center" class="STYLE3" >专用收据</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
          <td width="39%" height="25">客户姓名：<u><%=khxm%>&nbsp;&nbsp;</u></td>
          <td width="31%" >收款日期：<u>&nbsp;<%=skrq%>&nbsp;</u></td>
                <td width="30%">支票号：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
          </tr>
        </table>
		  </td>
        </tr>
        </table>
        
      <table width="100%" border="1" cellspacing="0" bgcolor="#FFFFFF"  style="FONT-SIZE:13">
        <tr align="center" height="28"> 
          <td width="16%">收款序号</td>
          <td width="58%">收款项目</td>
          <td width="26%">收款金额</td>
        </tr>
        <%

	for (int i=0;i<fkxh.length ;i++ )
	{
		temppp="";
		String xsfklx="";

		ls_sql="select cw_khfkjl.fklxbm,fklxmc,fkje,bz,skr,sksj,gysbh,cw_fkcs.fkcsmc";
		ls_sql+=" from cw_khfkjl,cw_fklxbm,cw_fkcs ";
		ls_sql+=" where cw_khfkjl.fklxbm=cw_fklxbm.fklxbm(+)";
		ls_sql+=" and cw_khfkjl.fkcs=cw_fkcs.fkcs(+) and cw_khfkjl.fkxh='"+fkxh[i]+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			fklxbm=cf.fillNull(rs.getString("fklxbm"));
			fklxmc=cf.fillNull(rs.getString("fklxmc"));
			fkcsmc=cf.fillNull(rs.getString("fkcsmc"));
			skje=rs.getDouble("fkje");
			bz=cf.fillHtml(rs.getString("bz"));
			skr=cf.fillNull(rs.getString("skr"));
			skrq=cf.fillNull(rs.getDate("sksj"));
			gysbh=cf.fillNull(rs.getString("gysbh"));
		}
		rs.close();
		ps.close();

		allskje+=skje;

	//判断收款类型
		String bm="";
		if (fklxbm.equals("21"))
		{
			ls_sql="select jc_mmydd.clgw,jc_mmydd.ztjjgw,jc_mmydd.pdgc";
			ls_sql+=" from jc_mmydd";
			ls_sql+=" where jc_mmydd.pdgcmc='"+gysbh+"' and jc_mmydd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="木门："+bm;
		}
		else if (fklxbm.equals("22"))
		{
			ls_sql="select jc_cgdd.clgw,jc_cgdd.ztjjgw,jc_cgdd.cgsjs,jc_cgdd.pdgc";
			ls_sql+=" from cw_khfkjl,sq_gysxx,jc_cgdd";
			ls_sql+=" where cw_khfkjl.gysbh=sq_gysxx.gysmc and sq_gysxx.gysbh=jc_cgdd.pdgc";
			ls_sql+=" and cw_khfkjl.gysbh='"+gysbh+"' and cw_khfkjl.khbh='"+khbh+"' and jc_cgdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				jjsjs=cf.fillNull(rs.getString("cgsjs"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="橱柜："+bm;
		}
		else if (fklxbm.equals("23"))
		{
			ls_sql="select jc_zcdd.clgw,jc_zcdd.ztjjgw,zcdlbm,zcxlbm";
			ls_sql+=" from jc_zcdd";
			ls_sql+=" where jc_zcdd.ppbm='"+gysbh+"' and jc_zcdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				temppp=cf.fillNull(rs.getString("zcdlbm"));
				temppp=temppp+"-";
				temppp+=cf.fillNull(rs.getString("zcxlbm"));
			}
			rs.close();
			ps.close();

			xsfklx="主材："+temppp+"-"+gysbh;
		}
		else if (fklxbm.equals("24"))
		{
			ls_sql="select jc_jjdd.clgw,jc_jjdd.ztjjgw,jc_jjdd.jjsjs,pdgc";
			ls_sql+=" from jc_jjdd";
			ls_sql+=" where jc_jjdd.pdgcmc='"+gysbh+"' and jc_jjdd.khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				clgw_o=cf.fillHtml(rs.getString("clgw"));
				ztjjgw=cf.fillHtml(rs.getString("ztjjgw"));
				jjsjs=cf.fillNull(rs.getString("jjsjs"));
				bm=cf.fillNull(rs.getString("pdgc"));
			}
			rs.close();
			ps.close();

			xsfklx="家具："+bm;
		}
		else if (fklxbm.equals("11"))//11：家装款；21:木门；22:橱柜；23:主材；24：家具
		{
			if (fkcsmc.equals(""))
			{
				xsfklx="家装款";
			}
			else{
				xsfklx="家装"+fkcsmc;
			}
		}
		else{
			xsfklx=fklxmc;
		}

		%> 
        <tr height="26"> 
          <td ><%=fkxh[i]%></td>
		  <td ><%=xsfklx%></td>
          <td ><%=skje%></td>
        </tr>
        <%

		if (i>=5)
		{
			break;
		}
	}

	for (int i=fkxh.length;i<6;i++ )
	{
		%> 
        <tr height="26"> 
          <td >&nbsp;</td>
          <td >&nbsp;</td>
          <td >&nbsp;</td>
        </tr>
        <%
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
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
        <tr > 
          <td height="28" align="center">合 计</td>
          <td height="28">大写金额合计：<%=cf.NumToRMBStr(allskje)%></td>
          <td height="28">小写金额合计：<%=allskje%>元</td>
        </tr>
      </table>
        
      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:15">
	<tr> 
	<td width="37%" height="25">签约店面：<%=dwmc%></td>
    <td width="27%" height="25">家装设计师：<%=sjs%></td>
    <td width="36%" height="25">家居顾问：<%=ztjjgw%>/<%=clgw_o%></td>
    </tr>
	<tr>
	  <td height="25">收款单位公章：</td>
	  <td height="25">收款人：<%=skr%></td>
	  <td height="25">客户签字：<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u></td>
    </tr>
  </table>
  </body>
</html>


<SCRIPT language=javascript >
<!--
//	WebBrowser.ExecWB(6,6); 
//	alert("打印命令已发出！");
//	window.close();
//-->
</SCRIPT>
