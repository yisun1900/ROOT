<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_yjdjl_jdjlh=null;
String crm_yjdjl_khbh=null;
String crm_zxkhxx_khxm=null;
String crm_zxkhxx_fwdz=null;
String crm_zxkhxx_hth=null;
String crm_zxkhxx_sjs=null;
String crm_yjdjl_sqrq=null;
String crm_yjdjl_sqr=null;
String crm_yjdjl_sqrlxdh=null;
String crm_yjdjl_sfxtp=null;
String crm_yjdjl_jhjdrq=null;
String crm_yjdjl_jhjdsj=null;
String crm_yjdjl_sqsm=null;
String crm_yjdjl_zcwcsj=null;
String crm_yjdjl_jdqrwcsj=null;
String crm_yjdjl_fbr=null;
String crm_yjdjl_fbsj=null;
String crm_yjdjl_zzqrjdrq=null;
String crm_yjdjl_zzqrjdsj=null;
String crm_yjdjl_sjjdsj=null;
String crm_yjdjl_jdsfcg=null;
String crm_yjdjl_sfkkg=null;
String crm_yjdjl_tzsfqr=null;
String crm_yjdjl_fasfkx=null;
String crm_yjdjl_khsfqr=null;
String crm_yjdjl_xcfzrqr=null;
String crm_yjdjl_qtczdqr=null;
String crm_yjdjl_clzt=null;
String crm_yjdjl_lrr=null;
String crm_yjdjl_lrsj=null;
String crm_yjdjl_lrbm=null;
String crm_yjdjl_sbsfcl=null;
String crm_yjdjl_tpshr=null;
String crm_yjdjl_tpshsj=null;
String crm_yjdjl_tpsftg=null;
String crm_yjdjl_tpsm=null;
String crm_yjdjl_jdqrjg=null;
String sgdmc=null;
String zjxm=null;

String wherecrm_yjdjl_jdjlh=null;
wherecrm_yjdjl_jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String sjsdh="";
//String qtsjs="";
try {
	conn=cf.getConnection();
	ls_sql="select sgdmc,sq_yhxx.dh,crm_yjdjl.zjxm,crm_yjdjl.jdjlh as crm_yjdjl_jdjlh,crm_yjdjl.khbh as crm_yjdjl_khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.hth as crm_zxkhxx_hth,crm_zxkhxx.sjs as crm_zxkhxx_sjs,crm_yjdjl.sqrq as crm_yjdjl_sqrq,crm_yjdjl.sqr as crm_yjdjl_sqr,crm_yjdjl.sqrlxdh as crm_yjdjl_sqrlxdh,crm_yjdjl.jhjdrq as crm_yjdjl_jhjdrq,crm_yjdjl.jhjdsj as crm_yjdjl_jhjdsj,crm_yjdjl.sqsm as crm_yjdjl_sqsm,crm_yjdjl.fbr as crm_yjdjl_fbr,crm_yjdjl.fbsj as crm_yjdjl_fbsj,crm_yjdjl.zzqrjdrq as crm_yjdjl_zzqrjdrq,crm_yjdjl.zzqrjdsj as crm_yjdjl_zzqrjdsj,crm_yjdjl.sjjdsj as crm_yjdjl_sjjdsj,crm_yjdjl.jdsfcg as crm_yjdjl_jdsfcg,crm_yjdjl.clzt as crm_yjdjl_clzt,crm_yjdjl.lrr as crm_yjdjl_lrr,crm_yjdjl.lrsj as crm_yjdjl_lrsj,crm_yjdjl.lrbm as crm_yjdjl_lrbm ";
	//设计师电话
	//ls_sql=" select dh from sq_yhxx";
	//ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+crm_khxx_sjs+"' and zwbm='04'";
    //sjsdh=cf.fillNull(rs.getString("dh"));
	ls_sql+=" from  crm_zxkhxx,crm_yjdjl,sq_sgd,sq_yhxx";
	ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh and crm_yjdjl.sgd=sq_sgd.sgd(+) and  (crm_yjdjl.jdjlh='"+wherecrm_yjdjl_jdjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		crm_yjdjl_jdjlh=cf.fillNull(rs.getString("crm_yjdjl_jdjlh"));
		crm_yjdjl_khbh=cf.fillNull(rs.getString("crm_yjdjl_khbh"));
		crm_zxkhxx_khxm=cf.fillNull(rs.getString("crm_zxkhxx_khxm"));
		crm_zxkhxx_fwdz=cf.fillNull(rs.getString("crm_zxkhxx_fwdz"));
		crm_zxkhxx_hth=cf.fillNull(rs.getString("crm_zxkhxx_hth"));
		crm_zxkhxx_sjs=cf.fillNull(rs.getString("crm_zxkhxx_sjs"));
		crm_yjdjl_sqrq=cf.fillNull(rs.getDate("crm_yjdjl_sqrq"));
		crm_yjdjl_sqr=cf.fillNull(rs.getString("crm_yjdjl_sqr"));
		crm_yjdjl_sqrlxdh=cf.fillNull(rs.getString("crm_yjdjl_sqrlxdh"));
		crm_yjdjl_jhjdrq=cf.fillNull(rs.getDate("crm_yjdjl_jhjdrq"));
		crm_yjdjl_jhjdsj=cf.fillNull(rs.getString("crm_yjdjl_jhjdsj"));
		crm_yjdjl_sqsm=cf.fillNull(rs.getString("crm_yjdjl_sqsm"));
		crm_yjdjl_fbr=cf.fillNull(rs.getString("crm_yjdjl_fbr"));
		crm_yjdjl_fbsj=cf.fillNull(rs.getDate("crm_yjdjl_fbsj"));
		crm_yjdjl_zzqrjdrq=cf.fillNull(rs.getDate("crm_yjdjl_zzqrjdrq"));
		crm_yjdjl_zzqrjdsj=cf.fillNull(rs.getString("crm_yjdjl_zzqrjdsj"));
		crm_yjdjl_sjjdsj=cf.fillNull(rs.getDate("crm_yjdjl_sjjdsj"));
		crm_yjdjl_jdsfcg=cf.fillNull(rs.getString("crm_yjdjl_jdsfcg"));
		crm_yjdjl_clzt=cf.fillNull(rs.getString("crm_yjdjl_clzt"));
		crm_yjdjl_lrr=cf.fillNull(rs.getString("crm_yjdjl_lrr"));
		crm_yjdjl_lrsj=cf.fillNull(rs.getDate("crm_yjdjl_lrsj"));
		crm_yjdjl_lrbm=cf.fillNull(rs.getString("crm_yjdjl_lrbm"));
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">预交底记录</div>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    预交底记录号  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jdjlh%>  </td>
  <td align="right" width="18%"> 
    客户编号  </td>
  <td width="32%"> 
    <%=crm_yjdjl_khbh%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户姓名  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_khxm%>  </td>
  <td align="right" width="18%"> 
    房屋地址  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_fwdz%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    合同号  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_hth%>  </td>
  <td align="right" width="18%"> 
    设计师  </td>
  <td width="32%"> 
    <%=crm_zxkhxx_sjs%> （<%=sjsdh%>） </td>
	
</tr>
<%--<tr bgcolor="#FFFFFF">
<td align="right" width="18%"> 
    设计师电话  </td>
</tr>--%>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">处理状态</td>
  <td><%
	cf.radioToken(out, "1+申请&2+确认&3+特批完成&4+发布&5+已预交底",crm_yjdjl_clzt,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请日期  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqrq%>  </td>
  <td align="right" width="18%"> 
    申请人  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请人联系电话  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sqrlxdh%>  </td>
  <td align="right" width="18%">&nbsp;</td>
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    计划预交底日期  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jhjdrq%>  </td>
  <td align="right" width="18%"> 
    计划预交底时间  </td>
  <td width="32%"> 
    <%=crm_yjdjl_jhjdsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    申请说明  </td>
  <td colspan="3"> 
    <%=crm_yjdjl_sqsm%>  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">录入部门 </td>
  <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where cxbz='N' order by dwbh",crm_yjdjl_lrbm,true);
%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"> 录入人 </td>
  <td><%=crm_yjdjl_lrr%> </td>
  <td align="right"> 录入时间 </td>
  <td><%=crm_yjdjl_lrsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">施工队</td>
  <td><%=sgdmc%></td>
  <td align="right">质检</td>
  <td><%=zjxm%></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right">派单人 </td>
  <td><%=crm_yjdjl_fbr%></td>
  <td align="right">派单时间</td>
  <td><%=crm_yjdjl_fbsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">最终确认预交底日期</td>
  <td><%=crm_yjdjl_zzqrjdrq%></td>
  <td align="right">最终确认预交底时间</td>
  <td><%=crm_yjdjl_zzqrjdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" bgcolor="#CCCCCC">&nbsp;</td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">预交底是否成功 </td>
  <td width="32%"><%
	cf.radioToken(out, "Y+成功&N+否",crm_yjdjl_jdsfcg,true);
%></td>
  <td align="right" width="18%"> 
    实际预交底时间  </td>
  <td width="32%"> 
    <%=crm_yjdjl_sjjdsj%>  </td>
</tr>
</table>
</body>
</html>
