<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>木门预订单处理</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<%

String jc_mmydd_yddbh=null;
String khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_khxx_kgrq=null;
String crm_khxx_jgrq=null;
String crm_khxx_sgd=null;
String crm_khxx_zjxm=null;
String crm_khxx_qyrq=null;
String crm_khxx_dwbh=null;
String jc_mmydd_wjqk=null;
String jc_mmydd_sqdj=null;
String jc_mmydd_clgw=null;
String jc_mmydd_pdgc=null;
String jc_mmydd_mmcljs=null;
String jc_mmydd_jhccsj=null;
String jc_mmydd_sccsj=null;
String jc_mmydd_ccsm=null;

double wdzje=0;
double htje=0;
double zqmmhtje=0;
double zqwjhtje=0;
double zqblhtje=0;
double mmhtje=0;
double wjhtje=0;
double blhtje=0;

String jc_mmydd_htrq=null;
String jc_mmydd_htqdr=null;
String jc_mmydd_htbz=null;
String jc_mmydd_wjsgsbz=null;
String jc_mmydd_swjsj=null;
String jc_mmydd_wjjsr=null;
String jc_mmydd_wjjsqk=null;
String jc_mmydd_srksj=null;
String jc_mmydd_rkr=null;
String jc_mmydd_rksm=null;
String jc_mmydd_jhazsj=null;
String jc_mmydd_sshsj=null;
String jc_mmydd_azkssj=null;
String jc_mmydd_azjssj=null;
String jc_mmydd_mmycyybm=null;
String jc_mmydd_ycsm=null;
String jc_mmydd_zsycyybm=null;
String jc_mmydd_ychsqk=null;
String jc_mmydd_ychsr=null;
String jc_mmydd_ychssj=null;
String jc_mmydd_sfjs=null;
String jc_mmydd_clzt=null;
String jc_mmydd_lrr=null;
String jc_mmydd_lrsj=null;
String sq_dwxx_dwmc=null;
String jc_mmydd_bz=null;

String sgbz=null;
String lxfs=null;

String paidr=null;
String paidsj=null;
String ycclzt=null;

String ssfgs=null;
String kjxsj=null;
String cxhdbm=null;
String sfydy=null;
double fwf=0;
double dysj=0;
double mmzkl=0;
double wjzkl=0;
double blzkl=0;
String dzyy=null;

String jc_mmydd_cljsdh="";
String jjwjbz="";

String yddbh=cf.GB2Uni(request.getParameter("yddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_khxx.jjwjbz,jc_mmydd.fwf,jc_mmydd.mmzkl,jc_mmydd.wjzkl,jc_mmydd.blzkl,jc_mmydd.dzyy,jc_mmydd.sfydy,(SYSDATE-jc_mmydd.dysj) dysj,cxhdbm,kjxsj,sgbz,paidr,paidsj,ycclzt,crm_khxx.lxfs,jc_mmydd.yddbh as jc_mmydd_yddbh,jc_mmydd.khbh as khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_khxx.kgrq as crm_khxx_kgrq,crm_khxx.jgrq as crm_khxx_jgrq,crm_khxx.sgd as crm_khxx_sgd,crm_khxx.zjxm as crm_khxx_zjxm,crm_khxx.qyrq as crm_khxx_qyrq,crm_khxx.dwbh as crm_khxx_dwbh,jc_mmydd.wjqk as jc_mmydd_wjqk,jc_mmydd.sqdj as jc_mmydd_sqdj,jc_mmydd.clgw as jc_mmydd_clgw,jc_mmydd.pdgc as jc_mmydd_pdgc,jc_mmydd.mmcljs as jc_mmydd_mmcljs,jc_mmydd.jhccsj as jc_mmydd_jhccsj,jc_mmydd.sccsj as jc_mmydd_sccsj,jc_mmydd.ccsm as jc_mmydd_ccsm,jc_mmydd.htrq as jc_mmydd_htrq,jc_mmydd.htqdr as jc_mmydd_htqdr,jc_mmydd.htbz as jc_mmydd_htbz,jc_mmydd.wjsgsbz as jc_mmydd_wjsgsbz,jc_mmydd.swjsj as jc_mmydd_swjsj,jc_mmydd.wjjsr as jc_mmydd_wjjsr,jc_mmydd.wjjsqk as jc_mmydd_wjjsqk,jc_mmydd.srksj as jc_mmydd_srksj,jc_mmydd.rkr as jc_mmydd_rkr,jc_mmydd.rksm as jc_mmydd_rksm,jc_mmydd.jhazsj as jc_mmydd_jhazsj,jc_mmydd.sshsj as jc_mmydd_sshsj,jc_mmydd.azkssj as jc_mmydd_azkssj,jc_mmydd.azjssj as jc_mmydd_azjssj,jc_mmydd.mmycyybm as jc_mmydd_mmycyybm,jc_mmydd.ycsm as jc_mmydd_ycsm,jc_mmydd.zsycyybm as jc_mmydd_zsycyybm,jc_mmydd.ychsqk as jc_mmydd_ychsqk,jc_mmydd.ychsr as jc_mmydd_ychsr,jc_mmydd.ychssj as jc_mmydd_ychssj,jc_mmydd.sfjs as jc_mmydd_sfjs,jc_mmydd.clzt as jc_mmydd_clzt,jc_mmydd.lrr as jc_mmydd_lrr,jc_mmydd.lrsj as jc_mmydd_lrsj,sq_dwxx.dwmc as sq_dwxx_dwmc,jc_mmydd.bz as jc_mmydd_bz ";
	ls_sql+=" ,jc_mmydd.wdzje,jc_mmydd.htje,jc_mmydd.zqmmhtje,jc_mmydd.zqwjhtje,jc_mmydd.zqblhtje,jc_mmydd.mmhtje,jc_mmydd.wjhtje,jc_mmydd.blhtje ";
	ls_sql+=" from  crm_khxx,jc_mmydd,sq_dwxx";
	ls_sql+=" where jc_mmydd.dwbh=sq_dwxx.dwbh and jc_mmydd.khbh=crm_khxx.khbh(+) and  (jc_mmydd.yddbh='"+yddbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwf=rs.getDouble("fwf");
		mmzkl=rs.getDouble("mmzkl");
		wjzkl=rs.getDouble("wjzkl");
		blzkl=rs.getDouble("blzkl");
		dzyy=cf.fillNull(rs.getString("dzyy"));
		sfydy=cf.fillNull(rs.getString("sfydy"));
		dysj=rs.getDouble("dysj");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		paidr=cf.fillNull(rs.getString("paidr"));
		paidsj=cf.fillNull(rs.getDate("paidsj"));
		ycclzt=cf.fillNull(rs.getString("ycclzt"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));

		jc_mmydd_yddbh=cf.fillNull(rs.getString("jc_mmydd_yddbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_khxx_kgrq=cf.fillNull(rs.getDate("crm_khxx_kgrq"));
		crm_khxx_jgrq=cf.fillNull(rs.getDate("crm_khxx_jgrq"));
		crm_khxx_sgd=cf.fillNull(rs.getString("crm_khxx_sgd"));
		crm_khxx_zjxm=cf.fillNull(rs.getString("crm_khxx_zjxm"));
		crm_khxx_qyrq=cf.fillNull(rs.getDate("crm_khxx_qyrq"));
		crm_khxx_dwbh=cf.fillNull(rs.getString("crm_khxx_dwbh"));
		jc_mmydd_wjqk=cf.fillNull(rs.getString("jc_mmydd_wjqk"));
		jc_mmydd_sqdj=cf.fillNull(rs.getString("jc_mmydd_sqdj"));
		jc_mmydd_clgw=cf.fillNull(rs.getString("jc_mmydd_clgw"));
		jc_mmydd_pdgc=cf.fillNull(rs.getString("jc_mmydd_pdgc"));
		jc_mmydd_mmcljs=cf.fillNull(rs.getString("jc_mmydd_mmcljs"));
		jc_mmydd_jhccsj=cf.fillNull(rs.getDate("jc_mmydd_jhccsj"));
		jc_mmydd_sccsj=cf.fillNull(rs.getDate("jc_mmydd_sccsj"));
		jc_mmydd_ccsm=cf.fillNull(rs.getString("jc_mmydd_ccsm"));
		wdzje=rs.getDouble("wdzje");
		htje=rs.getDouble("htje");
		zqmmhtje=rs.getDouble("zqmmhtje");
		zqwjhtje=rs.getDouble("zqwjhtje");
		zqblhtje=rs.getDouble("zqblhtje");
		mmhtje=rs.getDouble("mmhtje");
		wjhtje=rs.getDouble("wjhtje");
		blhtje=rs.getDouble("blhtje");
		jc_mmydd_htrq=cf.fillNull(rs.getDate("jc_mmydd_htrq"));
		jc_mmydd_htqdr=cf.fillNull(rs.getString("jc_mmydd_htqdr"));
		jc_mmydd_htbz=cf.fillNull(rs.getString("jc_mmydd_htbz"));
		jc_mmydd_wjsgsbz=cf.fillNull(rs.getString("jc_mmydd_wjsgsbz"));
		jc_mmydd_swjsj=cf.fillNull(rs.getDate("jc_mmydd_swjsj"));
		jc_mmydd_wjjsr=cf.fillNull(rs.getString("jc_mmydd_wjjsr"));
		jc_mmydd_wjjsqk=cf.fillNull(rs.getString("jc_mmydd_wjjsqk"));
		jc_mmydd_srksj=cf.fillNull(rs.getDate("jc_mmydd_srksj"));
		jc_mmydd_rkr=cf.fillNull(rs.getString("jc_mmydd_rkr"));
		jc_mmydd_rksm=cf.fillNull(rs.getString("jc_mmydd_rksm"));
		jc_mmydd_jhazsj=cf.fillNull(rs.getDate("jc_mmydd_jhazsj"));
		jc_mmydd_sshsj=cf.fillNull(rs.getDate("jc_mmydd_sshsj"));
		jc_mmydd_azkssj=cf.fillNull(rs.getDate("jc_mmydd_azkssj"));
		jc_mmydd_azjssj=cf.fillNull(rs.getDate("jc_mmydd_azjssj"));
		jc_mmydd_mmycyybm=cf.fillNull(rs.getString("jc_mmydd_mmycyybm"));
		jc_mmydd_ycsm=cf.fillNull(rs.getString("jc_mmydd_ycsm"));
		jc_mmydd_zsycyybm=cf.fillNull(rs.getString("jc_mmydd_zsycyybm"));
		jc_mmydd_ychsqk=cf.fillNull(rs.getString("jc_mmydd_ychsqk"));
		jc_mmydd_ychsr=cf.fillNull(rs.getString("jc_mmydd_ychsr"));
		jc_mmydd_ychssj=cf.fillNull(rs.getDate("jc_mmydd_ychssj"));
		jc_mmydd_sfjs=cf.fillNull(rs.getString("jc_mmydd_sfjs"));
		jc_mmydd_clzt=cf.fillNull(rs.getString("jc_mmydd_clzt"));
		jc_mmydd_lrr=cf.fillNull(rs.getString("jc_mmydd_lrr"));
		jc_mmydd_lrsj=cf.fillNull(rs.getDate("jc_mmydd_lrsj"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		jc_mmydd_bz=cf.fillNull(rs.getString("jc_mmydd_bz"));
	}
	rs.close();
	ps.close();

	if (jjwjbz.equals("Y"))
	{
		out.println("错误！客户家居已完结，不能再录入订单");
		return;
	}

 /*
	//判断是否能修改
	if (sfydy.equals("Y"))
	{
		if (dysj>120.0/(24*60))
		{
			out.println("错误！合同打印已超过120分钟，不能再修改，只能进行增减项");
			return;
		}
	}
*/

	//查询木门款
	double mmfkje=0;
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='21' and scbz='N'";//21:木门；22:橱柜；23:主材；24：家具
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		mmfkje=rs.getDouble(1);//已付木门款
	}
	rs.close();
	ps.close();


	if (mmfkje>0)//如果已付款，不能再修改
	{
		out.println("错误！客户已付款:"+mmfkje+"元，不能再修改，只能进行增减项");
		return;
	}



	int count=0;
	ls_sql="select count(*)";
	ls_sql+=" from  jc_mmzjx";
	ls_sql+=" where yddbh='"+yddbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (count>0)
	{
		%>
		<BR>
		<div align="center"><font color="#FF0033"><b>错误！本订单已发生过增减项，不能再修改</b></font> 
		
		<%
		return;
	}
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
  
<form method="post" action="" name="selectform" target="_blank">
<div align="center">木门购买---修改合同（单号：<%=yddbh%>）</div> 
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCFF">
      <td align="right">木门合同金额-折前</td>
      <td><%=zqmmhtje%></td>
      <td align="right">木门合同金额-折后</td>
      <td><%=mmhtje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">五金合同金额-折前</td>
      <td><%=zqwjhtje%></td>
      <td align="right">五金合同金额-折后</td>
      <td><%=wjhtje%> </td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td align="right">玻璃合同金额-折前</td>
      <td><%=zqblhtje%></td>
      <td align="right">玻璃合同金额-折后</td>
      <td><%=blhtje%></td>
    </tr>
    <tr bgcolor="#CCCCFF">
      <td bgcolor="#CCCCFF" align="right">合同金额-折前</td>
      <td><%=wdzje%></td>
      <td align="right">合同金额-折后</td>
      <td><%=htje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right"><font color="#FF0000">*</font>签合同日期</td>
      <td width="30%"> 
        <input type="text" name="htrq" size="20" maxlength="20" value="<%=jc_mmydd_htrq%>" onDblClick="JSCalendar(this)">      </td>
      <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">合同签定人</font></td>
      <td width="30%"> 
        <input type="text" name="htqdr" size="20" maxlength="20" value="<%=jc_mmydd_htqdr%>" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right"><font color="#FF0000">*</font>合同安装时间</td>
      <td width="30%"> 
        <input type="text" name="jhazsj" size="20" maxlength="20" value="<%=jc_mmydd_jhazsj%>" onDblClick="JSCalendar(this)">      </td>
      <td width="20%" align="right"><font color="#FF0000">*</font><font color="#0000CC">可减项截止时间</font></td>
      <td width="30%"> 
        <input type="text" name="kjxsj" size="20" maxlength="20" value="<%=kjxsj%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right"> 
        <font color="#FF0000">*</font>五金情况      </td>
      <td width="30%"> <%
	cf.radioToken(out, "wjqk","1+客户自购&2+公司购买",jc_mmydd_wjqk);
%> </td>
      <td width="20%" align="right" bgcolor="#FFFFFF"><font color="#CC0000">*</font>服务费 </td>
      <td width="30%"><input type="text" name="fwf" size="20" maxlength="20"  value="<%=fwf%>" ></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>木门订单折扣</td>
      <td bgcolor="#FFFFFF"><input type="text" name="mmzkl" size="8" maxlength="8" value="<%=mmzkl%>">
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>五金折扣率</td>
      <td bgcolor="#FFFFFF"><input type="text" name="wjzkl" size="8" maxlength="8" value="<%=wjzkl%>">
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font>玻璃折扣率</td>
      <td bgcolor="#FFFFFF"><input type="text" name="blzkl" size="8" maxlength="8" value="<%=blzkl%>">
          <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
      <td bgcolor="#FFFFFF">&nbsp;</td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right">打折原因</td>
      <td colspan="3"><textarea name="dzyy" cols="71" rows="3"><%=dzyy%></textarea></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="20%" align="right">合同备注</td>
      <td colspan="3"> 
        <textarea name="htbz" rows="2" cols="71"><%=jc_mmydd_htbz%></textarea>      </td>
    </tr>
    <tr bgcolor="#E8E8FF">
      <td colspan="4" align="center">
        <table width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td width="50%" align="right"><input type="hidden" name="yddbh"  value="<%=yddbh%>" >
              <input name="button3" type="button" onClick="f_do(selectform)"  value="存 盘">
            <input type="button"  value="打印合同" onClick="window.open('/jcjj/dygl/dymmht.jsp?yddbh=<%=yddbh%>')" name="dy"></td>
            <td width="50%">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value="木门初测单" onClick="window.open('/jcjj/mmdd/ViewJc_mmccd.jsp?yddbh=<%=yddbh%>')" >
            <input type="button" value="合同明细" onClick="window.open('/jcjj/mmdd/ViewJc_mmdgdmx.jsp?yddbh=<%=yddbh%>')" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="录入木门明细" onClick="f_lrmm(selectform)" name="lrmm" ></td>
            <td><input type="button"  value="查看木门明细" onClick="f_ckmm(selectform)" name="ckmm" ></td>
          </tr>
          <tr>
            <td align="right"><input type="button"  value="录入五金明细" onClick="f_lrwj(selectform)" name="lrwj" ></td>
            <td><input type="button"  value="查看五金明细" onClick="f_ckwj(selectform)" name="ckwj" ></td>
          </tr>
          <tr>
            <td height="23" align="right"><input type="button"  value="录入玻璃明细" onClick="f_lrbl(selectform)" name="lrbl" ></td>
            <td><input type="button"  value="查看玻璃明细" onClick="f_ckbl(selectform)" name="ckbl" ></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
<table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户编号    </td>
    <td width="31%"> <%=khbh%></td>
    <td width="18%" align="right"> 
      合同号    </td>
    <td width="32%"><%=crm_khxx_hth%> </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      客户姓名    </td>
    <td width="31%"> <%=crm_khxx_khxm%></td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right">房屋地址</td>
    <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right" bgcolor="#CCCCFF">签约店面</td>
    <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+crm_khxx_dwbh+"'",crm_khxx_dwbh,true);
%></td>
    <td width="18%" align="right">设计师</td>
    <td width="32%"><%=crm_khxx_sjs%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      施工队    </td>
    <td width="31%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+crm_khxx_sgd+"'",crm_khxx_sgd,true);
%></td>
    <td width="18%" align="right"> 
      班长    </td>
    <td width="32%"><%=sgbz%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      家装签约日期    </td>
    <td width="31%"> <%=crm_khxx_qyrq%> </td>
    <td width="18%" align="right"> 
      质检    </td>
    <td width="32%"><%=crm_khxx_zjxm%></td>
  </tr>
  <tr bgcolor="#CCCCFF"> 
    <td width="19%" align="right"> 
      合同开工日期    </td>
    <td width="31%"> <%=crm_khxx_kgrq%> </td>
    <td width="18%" align="right"> 
      合同竣工日期    </td>
    <td width="32%"> <%=crm_khxx_jgrq%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="19%" align="right">参加促销活动</td>
    <td colspan="3"> <%=cxhdbm%> </td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td height="21" colspan="4"> 
    <div align="center"></td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      五金情况    </td>
    <td width="31%"> <%
	cf.radioToken(out, "1+客户自购&2+公司购买",jc_mmydd_wjqk,true);
%> </td>
    <td width="18%" align="right"> 
      木门定金    </td>
    <td width="32%"> <%=jc_mmydd_sqdj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right" bgcolor="#99CCFF"> 
      驻店家居顾问    </td>
    <td width="31%"> <%=jc_mmydd_clgw%> </td>
    <td width="18%" align="right">    </td>
    <td width="32%">&nbsp; </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入人    </td>
    <td width="31%"> <%=jc_mmydd_lrr%> </td>
    <td width="18%" align="right"> 
      录入时间    </td>
    <td width="32%"> <%=jc_mmydd_lrsj%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" align="right"> 
      录入部门    </td>
    <td width="31%"> <%=sq_dwxx_dwmc%> </td>
    <td width="18%" align="right"> 
      处理状态    </td>
    <td width="32%"><%
	cf.selectItem(out,"select clzt,clztmc from jdm_mmyddzt where clzt='"+jc_mmydd_clzt+"'",jc_mmydd_clzt,true);
%> </td>
  </tr>
  <tr bgcolor="#99CCFF"> 
    <td width="19%" bgcolor="#99CCFF" align="right">备注</td>
    <td colspan="3"><%=jc_mmydd_bz%></td>
  </tr>
  <tr align="right" bgcolor="#FFFFFF"> 
    <td height="17" colspan="4" align="center"> 
      <div align="center"></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right"> 
      派单工厂    </td>
    <td width="31%"> <%=jc_mmydd_pdgc%> </td>
    <td width="18%" align="right"> 
      木门测量技师    </td>
    <td width="32%"><%=jc_mmydd_mmcljs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right">派单人</td>
    <td width="31%"><%=paidr%></td>
    <td width="18%" align="right">派单时间</td>
    <td width="32%"><%=paidsj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#FFFFCC"> 
      计划初测时间    </td>
    <td width="31%"><%=jc_mmydd_jhccsj%> </td>
    <td width="18%" align="right"> 
      实初测时间    </td>
    <td width="32%"><%=jc_mmydd_sccsj%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#FFFFCC">初测说明</td>
    <td colspan="3"><%=jc_mmydd_ccsm%></td>
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

	if(	javaTrim(FormName.jhazsj)=="") {
		alert("请输入[合同安装时间]！");
		FormName.jhazsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jhazsj, "合同安装时间"))) {
		return false;
	}

	if(	javaTrim(FormName.htrq)=="") {
		alert("请输入[签合同日期]！");
		FormName.htrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.htrq, "签合同日期"))) {
		return false;
	}
	if(	javaTrim(FormName.htqdr)=="") {
		alert("请输入[合同签定人]！");
		FormName.htqdr.focus();
		return false;
	}

	if(	javaTrim(FormName.kjxsj)=="") {
		alert("请输入[可减项截止时间]！");
		FormName.kjxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kjxsj, "可减项截止时间"))) {
		return false;
	}
	if(	!radioChecked(FormName.wjqk)) {
		alert("请选择[五金情况]！");
		FormName.wjqk[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fwf)=="") {
		alert("请输入[服务费]！");
		FormName.fwf.focus();
		return false;
	}
	if(!(isFloat(FormName.fwf, "服务费"))) {
		return false;
	}
	if(	javaTrim(FormName.mmzkl)=="") {
		alert("请输入[木门折扣率]！");
		FormName.mmzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.mmzkl, "木门折扣率"))) {
		return false;
	}
	if (FormName.mmzkl.value<=0 || FormName.mmzkl.value>10)
	{
		alert("错误！[木门折扣率]应该在0和10之间！");
		FormName.mmzkl.select();
		return false;
	}
	if(	javaTrim(FormName.wjzkl)=="") {
		alert("请输入[五金折扣率]！");
		FormName.wjzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.wjzkl, "五金折扣率"))) {
		return false;
	}
	if (FormName.wjzkl.value<=0 || FormName.wjzkl.value>10)
	{
		alert("错误！[五金折扣率]应该在0和10之间！");
		FormName.wjzkl.select();
		return false;
	}
	if(	javaTrim(FormName.blzkl)=="") {
		alert("请输入[玻璃折扣率]！");
		FormName.blzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.blzkl, "玻璃折扣率"))) {
		return false;
	}
	if (FormName.blzkl.value<=0 || FormName.blzkl.value>10)
	{
		alert("错误！[玻璃折扣率]应该在0和10之间！");
		FormName.blzkl.select();
		return false;
	}
	if (FormName.mmzkl.value!=10 || FormName.wjzkl.value!=10 || FormName.blzkl.value!=10)
	{
		if(	javaTrim(FormName.dzyy)=="") {
			alert("请输入[打折原因]！");
			FormName.dzyy.focus();
			return false;
		}
	}


	FormName.action="SaveXgDgJc_mmydd.jsp";
	FormName.submit();
	return true;

}


function f_lrmm(FormName)//参数FormName:Form的名称
{
	FormName.action="Jc_mmdgdmxMain.jsp";
	FormName.submit();
	return true;
}

function f_ckmm(FormName)//参数FormName:Form的名称
{
	FormName.action="Jc_mmdgdmxList.jsp";
	FormName.submit();
	return true;
}

function f_lrwj(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertJc_wjjddmxMain.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckwj(FormName)//参数FormName:Form的名称
{
	FormName.action="Jc_wjjddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}
function f_lrbl(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertJc_blddmx.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}

function f_ckbl(FormName)//参数FormName:Form的名称
{
	FormName.action="Jc_blddmxList.jsp";
	FormName.target="_blank";
	FormName.submit();
	return true;
}



//-->
</SCRIPT>
