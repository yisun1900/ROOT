<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String clgw=null;
String ztjjgw=null;
String jkxz=null;
String jkdd=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String hkze=null;
String jhtzshsj=null;
String bz=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;
String ppmc=null;
String gys=null;

double zcyfk=0;
double mmyfk=0;
double cgyfk=0;
double jjyfk=0;

String sqdj="";
String wdzje=null;
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;

double zczkl=0;
String listSql="";

try {
	conn=cf.getConnection();

	ls_sql="select dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,ppmc,gys,ppbm,khbh,clgw,ztjjgw,jkxz,jkdd,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze,jhtzshsj ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where  (ddbh='"+ddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dzyy=cf.fillNull(rs.getString("dzyy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");

		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		gys=cf.fillNull(rs.getString("gys"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		jkxz=cf.fillNull(rs.getString("jkxz"));
		jkdd=cf.fillNull(rs.getString("jkdd"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=cf.fillNull(rs.getString("hkze"));
		jhtzshsj=cf.fillNull(rs.getDate("jhtzshsj"));
	}
	rs.close();
	ps.close();


	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
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
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();


	//预付款
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='62'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zcyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='63'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='64'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cgyfk=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and scbz='N' and fklxbm='65'";//62：主材预付款；63：木门预付款；64：橱柜预付款；65：家具预付款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jjyfk=rs.getDouble(1);
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
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护-特权（订单编号：<%=ddbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#CCCCFF"> 
                <div align="right">客户编号</div>              </td>
              <td width="31%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right">合同号</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">客户姓名</td>
              <td width="31%"><%=khxm%></td>
              <td width="18%" align="right">质检</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#CCCCFF" align="right">签约店面</td>
              <td width="31%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="18%" bgcolor="#CCCCFF" align="right">家装设计师</td>
              <td width="32%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">施工队</div>              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="18%"> 
                <div align="right">班长</div>              </td>
              <td width="32%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">家装签约日期</div>              </td>
              <td width="31%"> <%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">家装签约额</div>              </td>
              <td width="32%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">合同开工日期</td>
              <td width="31%"><%=kgrq%></td>
              <td width="18%" align="right">合同竣工日期</td>
              <td width="32%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right">参加促销活动</td>
              <td width="31%"> <%=cxhdbm%> </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"><b>主材预付款</b></td>
              <td width="31%"><%=zcyfk%></td>
              <td width="18%" align="right"><b>木门预付款</b></td>
              <td width="32%"><%=mmyfk%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="19%" align="right"><b>橱柜预付款</b></td>
              <td width="31%"><%=cgyfk%></td>
              <td width="18%" align="right"><b>家具预付款</b></td>
              <td width="32%"><%=jjyfk%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#0000FF">合同总额</font></td>
              <td width="31%"> 
                <input type="hidden" name="oldhkze" value="<%=hkze%>" >
                <input type="text" name="hkze" value="<%=hkze%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC"><font color="#0000FF">未打折金额</font></td>
              <td width="32%"> 
                <input type="text" name="wdzje" value="<%=wdzje%>" size="20" maxlength="20" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="19%" align="right"><font color="#0000FF">计入促销活动金额</font></td>
              <td width="31%"> 
                <input type="text" name="htcxhdje" value="<%=htcxhdje%>" size="20" maxlength="10" readonly>              </td>
              <td width="18%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#FF0000">*</font><font color="#0000FF">主材大类</font></td>
              <td width="31%"> 
                <input type="text" name="zcdlbm" value="<%=zcdlbm%>" readonly>              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000FF">主材小类</font></td>
              <td width="32%"> 
                <input type="text" name="zcxlbm" value="<%=zcxlbm%>" readonly>              </td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>子品牌</td>
              <td><select name="ppbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jxc_ppxx.ppmc c1,jxc_ppxx.ppmc c2 from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+ssfgs+"' order by jxc_ppxx.ppmc",ppbm);
%>
                </select>              </td>
              <td align="right"><font color="#FF0000">*</font>品牌</td>
              <td><select name="ppmc" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select distinct jxc_ppxx.scsmc c1,jxc_ppxx.scsmc c2 from jxc_ppxx,jxc_ppsqfgs where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppsqfgs.ssfgs='"+ssfgs+"' order by jxc_ppxx.scsmc",ppmc);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>供应商</td>
              <td><select name="gys" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select distinct jxc_gysxx.gysmc c1,jxc_gysxx.gysmc c2 from jxc_ppxx,jxc_ppsqfgs,jxc_ppgysdzb,jxc_gysxx where jxc_ppxx.ppbm=jxc_ppsqfgs.ppbm and jxc_ppxx.ppbm=jxc_ppgysdzb.ppbm and jxc_ppgysdzb.gysbm=jxc_gysxx.gysbm and jxc_ppsqfgs.ssfgs='"+ssfgs+"' order by jxc_gysxx.gysmc",gys);
%>
              </select></td>
              <td align="right"><font color="#FF0000">*</font><font color="#0000FF">订单折扣</font></td>
              <td><input type="text" name="zczkl" size="8" maxlength="8" value="<%=zczkl%>" readonly="true">
                <b><font color="#0000FF">（>0且<=10）</font></b></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">打折原因</font></td>
              <td colspan="3">
                <textarea name="dzyy" cols="71" rows="3" readonly="readonly" ><%=dzyy%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF" > 
              <td width="19%" align="right"><font color="#0000FF">品牌是否有优惠</font></td>
              <td width="31%"><%
	cf.radioToken(out,"N+否&Y+是",sfyyh,true);
%></td>
              <td width="18%" align="right"><font color="#0000FF">优惠期</font></td>
              <td width="32%">(<%=yhkssj%>)－－(<%=yhjzsj%>)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#0000FF">优惠内容</font></td>
              <td colspan="3"><%=yhnr%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right"><font color="#FF0000">*</font>项目专员</td>
              <td width="31%"> 
                <select name="xmzy" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqfgs ";
	listSql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" UNION ALL ";

	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqbm ";
	listSql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='10' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,xmzy);
%> 
				</select>              </td>
              <td width="18%" align="right">家居设计师</td>
              <td width="32%"> 
                <select name="jjsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqfgs ";
	listSql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" UNION ALL ";

	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqbm ";
	listSql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='12' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" ORDER BY sfzszg desc,c2 ";
	cf.selectItem(out,listSql,jjsjs);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>驻店家居顾问</div>              </td>
              <td width="31%"> 
                <select name="clgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqfgs ";
	listSql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" UNION ALL ";

	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqbm ";
	listSql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" ORDER BY sfzszg desc,c2 ";

	cf.selectItem(out,listSql,clgw);
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>展厅家居顾问</div>              </td>
              <td width="32%"> 
                <select name="ztjjgw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	listSql =" select sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqfgs ";
	listSql+=" where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" UNION ALL ";

	listSql+=" select distinct sq_yhxx.yhmc c1,sq_yhxx.yhmc||DECODE(sq_yhxx.sfzszg,'S','（辞职）','T','（辞退）','D','（待岗）','M','','N','','Y','') c2,sq_yhxx.sfzszg  ";
	listSql+=" from sq_yhxx,sq_sqbm ";
	listSql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.ssfgs='"+ssfgs+"' ";
	listSql+=" and sq_yhxx.zwbm='08' and sq_yhxx.sfzszg in('Y','N','S','T','D') ";

	listSql+=" ORDER BY sfzszg desc,c2 ";
	
	cf.selectItem(out,listSql,ztjjgw);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">是否需测量</div></td>
              <td><select name="xclbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+不需测量&2+需测量",xclbz);
%>
                </select>              </td>
              <td><div align="right">计划测量时间</div></td>
              <td><input type="text" name="jhclsj" size="20" maxlength="10"  value="<%=jhclsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>是否等待送货通知</div>              </td>
              <td width="31%"> 
                <select name="ddshbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+不需等待通知&2+需等待通知",ddshbz);
%> 
                </select>              </td>
              <td width="18%"> 
                <div align="right">计划通知送货时间</div>              </td>
              <td width="32%"> 
                <input type="text" name="jhtzshsj" value="<%=jhtzshsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">合同送货时间</td>
              <td width="31%"> 
                <input type="text" name="htshsj" size="20" maxlength="10"  value="<%=htshsj%>" onDblClick="JSCalendar(this)">              </td>
              <td width="18%" align="right"><font color="#FF0000">*</font>签合同时间</td>
              <td width="32%"> 
                <input type="text" name="qhtsj" size="20" maxlength="10"  value="<%=qhtsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">可减项截止时间</div>              </td>
              <td width="31%"> 
                <input type="text" name="kjxsj" size="20" maxlength="10"  value="<%=kjxsj%>" onDblClick="JSCalendar(this)">              </td>
              <td width="18%"> 
                <div align="right"></div>              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="ssfgs" value="<%=ssfgs%>" >
                  <input type="hidden" name="ddbh" value="<%=ddbh%>" >
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
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
	if(	javaTrim(FormName.ddbh)=="") {
		alert("请输入[订单编号]！");
		FormName.ddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}


/*	
	if(	!radioChecked(FormName.jkxz)) {
		alert("请选择[客户交款性质]！");
		FormName.jkxz[0].focus();
		return false;
	}

	if (FormName.jkxz[0].checked)
	{
		notRadio(FormName.jkdd);
	}
	else{
		if(	!radioChecked(FormName.jkdd)) {
			alert("请选择[交款地点]！");
			FormName.jkdd[0].focus();
			return false;
		}
	}
*/

	if(	javaTrim(FormName.hkze)=="") {
		alert("请选择[合同总额]！");
		FormName.hkze.focus();
		return false;
	}
	if(!(isFloat(FormName.hkze, "合同总额"))) {
		return false;
	}

/*
	if (parseFloat(FormName.hkze.value)==0)
	{
		alert("[合同总额]不能为0！");
		FormName.hkze.select();
		return false;
	}
*/
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请输入[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if (parseFloat(FormName.wdzje.value)<parseFloat(FormName.hkze.value))
	{
		alert("[未打折金额]不能小于[合同总额]！");
		FormName.htze.select();
		return false;
	}
	if(	javaTrim(FormName.wdzje)=="") {
		alert("请选择[未打折金额]！");
		FormName.wdzje.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzje, "未打折金额"))) {
		return false;
	}
	if(	javaTrim(FormName.htcxhdje)=="") {
		alert("请选择[计入促销活动金额]！");
		FormName.htcxhdje.focus();
		return false;
	}
	if(!(isFloat(FormName.htcxhdje, "计入促销活动金额"))) {
		return false;
	}
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
	if(	javaTrim(FormName.ddshbz)=="") {
		alert("请选择[等待送货通知标志]！");
		FormName.ddshbz.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhtzshsj, "计划通知送货时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(!(isDatetime(FormName.htshsj, "合同送货时间"))) {
		return false;
	}
	if(	javaTrim(FormName.qhtsj)=="") {
		alert("请输入[签合同时间]！");
		FormName.qhtsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qhtsj, "签合同时间"))) {
		return false;
	}
	if(	javaTrim(FormName.zczkl)=="") {
		alert("请输入[订单折扣]！");
		FormName.zczkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zczkl, "订单折扣"))) {
		return false;
	}
	if (FormName.zczkl.value<=0 || FormName.zczkl.value>10)
	{
		alert("错误！[订单折扣]应该在0和10之间！");
		FormName.zczkl.select();
		return false;
	}
	if (FormName.zczkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}

	FormName.action="SaveTqEditJc_zcdd.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
