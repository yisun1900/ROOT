<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%

String sq_yhxx_ygbh=null;
String sq_yhxx_yhmc=null;
String sq_yhxx_yhdlm=null;
String sq_yhxx_yhkl=null;
String sq_yhxx_yhjs=null;
String sq_dwxx_dwmc=null;
String sq_yhxx_sjsbh=null;
String sq_yhxx_xb=null;
String sq_yhxx_csrq=null;
String sq_yhxx_hf=null;
String sq_yhxx_mz=null;
String sq_yhxx_sfzh=null;
String sq_yhxx_hjszd=null;
String sq_yhxx_dacfd=null;
String sq_yhxx_byyx=null;
String sq_yhxx_zy=null;
String sq_yhxx_dh=null;
String sq_yhxx_email=null;
String sq_yhxx_zz=null;
String dm_zwbm_zwmc=null;
String sq_yhxx_sfzszg=null;
String sq_yhxx_rzsj=null;
String sq_yhxx_htksrq=null;
String sq_yhxx_htdqrq=null;
String sq_yhxx_lzyy=null;
String sq_yhxx_lzrq=null;
String sq_yhxx_sfqs=null;
String sq_yhxx_zkl=null;
String sq_yhxx_ckjgbz=null;
String sq_yhxx_zdyhbz=null;
String sq_yhxx_kdlxtbz=null;
String sq_yhxx_bjjb=null;
String sq_yhxx_sjsjb=null;
String sq_yhxx_sfydbs=null;
String sq_yhxx_sfytj=null;
String sq_yhxx_tjrq=null;
String sq_yhxx_bz=null;
String bianhao=null;
String xlbm=null;

String jjlxr=null;
String lxrdh=null;
String cjgzsj=null;
String ssfgs=null;
String yhdlm=null;
String kfgssq=null;
String sqdwmc="";


//214
String wheresq_yhxx_ygbh=cf.GB2Uni(request.getParameter("ygbh"));
String qwer=cf.fillNull(request.getParameter("qwer"));
if (!qwer.equals("hellCHoF"))
{
	out.println(qwer);
	return;
}
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select yhdlm,kfgssq,sq_yhxx.ssfgs,cjgzsj,lxrdh,jjlxr,xlbm,bianhao,sq_yhxx.ygbh as sq_yhxx_ygbh,sq_yhxx.yhmc as sq_yhxx_yhmc,sq_yhxx.yhdlm as sq_yhxx_yhdlm,sq_yhxx.yhkl as sq_yhxx_yhkl,sq_yhxx.yhjs as sq_yhxx_yhjs,sq_dwxx.dwmc as sq_dwxx_dwmc,sq_yhxx.sjsbh as sq_yhxx_sjsbh,sq_yhxx.xb as sq_yhxx_xb,sq_yhxx.csrq as sq_yhxx_csrq,sq_yhxx.hf as sq_yhxx_hf,sq_yhxx.mz as sq_yhxx_mz,sq_yhxx.sfzh as sq_yhxx_sfzh,sq_yhxx.hjszd as sq_yhxx_hjszd,sq_yhxx.dacfd as sq_yhxx_dacfd,sq_yhxx.byyx as sq_yhxx_byyx,sq_yhxx.zy as sq_yhxx_zy,sq_yhxx.dh as sq_yhxx_dh,sq_yhxx.email as sq_yhxx_email,sq_yhxx.zz as sq_yhxx_zz,dm_zwbm.zwmc as dm_zwbm_zwmc,sq_yhxx.sfzszg as sq_yhxx_sfzszg,sq_yhxx.rzsj as sq_yhxx_rzsj,sq_yhxx.htksrq as sq_yhxx_htksrq,sq_yhxx.htdqrq as sq_yhxx_htdqrq,sq_yhxx.lzyy as sq_yhxx_lzyy,sq_yhxx.lzrq as sq_yhxx_lzrq,sq_yhxx.sfqs as sq_yhxx_sfqs,sq_yhxx.zkl as sq_yhxx_zkl,sq_yhxx.ckjgbz as sq_yhxx_ckjgbz,sq_yhxx.zdyhbz as sq_yhxx_zdyhbz,sq_yhxx.kdlxtbz as sq_yhxx_kdlxtbz,sq_yhxx.bjjb as sq_yhxx_bjjb,sq_yhxx.sjsjb as sq_yhxx_sjsjb,sq_yhxx.sfydbs as sq_yhxx_sfydbs,sq_yhxx.sfytj as sq_yhxx_sfytj,sq_yhxx.tjrq as sq_yhxx_tjrq,sq_yhxx.bz as sq_yhxx_bz ";
	ls_sql+=" from  dm_zwbm,sq_dwxx,sq_yhxx";
	ls_sql+=" where sq_yhxx.zwbm=dm_zwbm.zwbm(+) and sq_yhxx.dwbh=sq_dwxx.dwbh and  (sq_yhxx.ygbh='"+wheresq_yhxx_ygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		kfgssq=cf.fillNull(rs.getString("kfgssq"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		cjgzsj=cf.fillNull(rs.getDate("cjgzsj"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));

		xlbm=cf.fillNull(rs.getString("xlbm"));
		bianhao=cf.fillNull(rs.getString("bianhao"));
		sq_yhxx_ygbh=cf.fillNull(rs.getString("sq_yhxx_ygbh"));
		sq_yhxx_yhmc=cf.fillNull(rs.getString("sq_yhxx_yhmc"));
		sq_yhxx_yhdlm=cf.fillNull(rs.getString("sq_yhxx_yhdlm"));
		sq_yhxx_yhkl=cf.fillNull(rs.getString("sq_yhxx_yhkl"));
		sq_yhxx_yhjs=cf.fillNull(rs.getString("sq_yhxx_yhjs"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		sq_yhxx_sjsbh=cf.fillNull(rs.getString("sq_yhxx_sjsbh"));
		sq_yhxx_xb=cf.fillNull(rs.getString("sq_yhxx_xb"));
		sq_yhxx_csrq=cf.fillNull(rs.getDate("sq_yhxx_csrq"));
		sq_yhxx_hf=cf.fillNull(rs.getString("sq_yhxx_hf"));
		sq_yhxx_mz=cf.fillNull(rs.getString("sq_yhxx_mz"));
		sq_yhxx_sfzh=cf.fillNull(rs.getString("sq_yhxx_sfzh"));
		sq_yhxx_hjszd=cf.fillNull(rs.getString("sq_yhxx_hjszd"));
		sq_yhxx_dacfd=cf.fillNull(rs.getString("sq_yhxx_dacfd"));
		sq_yhxx_byyx=cf.fillNull(rs.getString("sq_yhxx_byyx"));
		sq_yhxx_zy=cf.fillNull(rs.getString("sq_yhxx_zy"));
		sq_yhxx_dh=cf.fillNull(rs.getString("sq_yhxx_dh"));
		sq_yhxx_email=cf.fillNull(rs.getString("sq_yhxx_email"));
		sq_yhxx_zz=cf.fillNull(rs.getString("sq_yhxx_zz"));
		dm_zwbm_zwmc=cf.fillNull(rs.getString("dm_zwbm_zwmc"));
		sq_yhxx_sfzszg=cf.fillNull(rs.getString("sq_yhxx_sfzszg"));
		sq_yhxx_rzsj=cf.fillNull(rs.getDate("sq_yhxx_rzsj"));
		sq_yhxx_htksrq=cf.fillNull(rs.getDate("sq_yhxx_htksrq"));
		sq_yhxx_htdqrq=cf.fillNull(rs.getDate("sq_yhxx_htdqrq"));
		sq_yhxx_lzyy=cf.fillNull(rs.getString("sq_yhxx_lzyy"));
		sq_yhxx_lzrq=cf.fillNull(rs.getDate("sq_yhxx_lzrq"));
		sq_yhxx_sfqs=cf.fillNull(rs.getString("sq_yhxx_sfqs"));
		sq_yhxx_zkl=cf.fillNull(rs.getString("sq_yhxx_zkl"));
		sq_yhxx_ckjgbz=cf.fillNull(rs.getString("sq_yhxx_ckjgbz"));
		sq_yhxx_zdyhbz=cf.fillNull(rs.getString("sq_yhxx_zdyhbz"));
		sq_yhxx_kdlxtbz=cf.fillNull(rs.getString("sq_yhxx_kdlxtbz"));
		sq_yhxx_bjjb=cf.fillNull(rs.getString("sq_yhxx_bjjb"));
		sq_yhxx_sjsjb=cf.fillNull(rs.getString("sq_yhxx_sjsjb"));
		sq_yhxx_sfydbs=cf.fillNull(rs.getString("sq_yhxx_sfydbs"));
		sq_yhxx_sfytj=cf.fillNull(rs.getString("sq_yhxx_sfytj"));
		sq_yhxx_tjrq=cf.fillNull(rs.getDate("sq_yhxx_tjrq"));
		sq_yhxx_bz=cf.fillNull(rs.getString("sq_yhxx_bz"));
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 员工信息（录入序号：<%=sq_yhxx_ygbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">工号</div>            </td>
            <td width="32%"><%=bianhao%> </td>
            <td width="20%"> 
              <div align="right">员工名称</div>            </td>
            <td width="30%"> <%=sq_yhxx_yhmc%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">所属分公司</td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%> </td>
            <td width="20%" align="right">所属单位</td>
            <td width="30%"><%=sq_dwxx_dwmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">所属部门小组</td>
            <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sq_yhxx_sjsbh+"'",sq_yhxx_sjsbh,true);
%></td>
            <td width="20%" align="right">身份证号</td>
            <td width="30%"><%=sq_yhxx_sfzh%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">用户登录名</div>            </td>
            <td width="32%"> <%=sq_yhxx_yhdlm%> </td>
            <td width="20%"> 
              <div align="right">用户口令</div>            </td>
            <td width="30%"><%=cf.makejm(sq_yhxx_yhkl) %></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">用户角色</div>            </td>
            <td width="32%"> <%
	cf.selectToken(out,"A0+总部&A1+总部各部门&F0+分公司&F1+分公司各部门&F2+店面&F3+部门小组&G0+供应商&J0+加盟商",sq_yhxx_yhjs,true);
%> </td>
            <td width="20%"> 
              <div align="right">可登陆系统标志</div>            </td>
            <td width="30%"><%
	cf.radioToken(out, "Y+可登陆&N+不可登陆",sq_yhxx_kdlxtbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%"> 
              <div align="right">允许查看价格明细</div>            </td>
            <td width="32%"> <%
	cf.radioToken(out, "Y+可看&N+不可看",sq_yhxx_ckjgbz,true);
%> </td>
            <td width="20%"> 
              <div align="right">重点用户标志</div>            </td>
            <td width="30%"> <%
	cf.radioToken(out, "Y+是&N+否",sq_yhxx_zdyhbz,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"><b> </b></td>
            <td colspan="3"><b><%
	cf.selectToken(out,"0+不授权&1+授权单个分公司&2+授权多个分公司&3+授权单个店面&4+授权某一分公司多个店面&5+授权多个分公司多个店面",kfgssq,true);
%></b>：<%=sqdwmc%></td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
