<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000FF}
.STYLE6 {color: #0000CC}
-->
</style>
</head>
<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jsjlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=0;
String zjxxh=null;
int fwmj=0;

double zqgczjf=0;
double zjxje=0;

double jsglk=0;
double cfje=0;

double bcflk=0;
double kzbjbl=0;
double kzbj=0;

double rgfbfb=0;
double yfrgf=0;
double bcrgf=0;

double bcfkhj=0;

double ysglk=0;
double yscfje=0;
double ysfwmjcz=0;
double ysclfbfb=0;

double sgdzbj=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fwmj,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,sgebfb,zjxxh";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fwmj=rs.getInt("fwmj");
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sgebfb=rs.getDouble("sgebfb");
		zjxxh=cf.fillNull(rs.getString("zjxxh"));

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	if (gdjsjd.equals("8"))//A:可以第一次拨工费
	{
		out.println("<BR>！！！错误，结算进度不正确");
		return;
	}


	ls_sql="select clfbfb,cfje,fwmjcz,ysglk";
	ls_sql+=" from cw_cflkjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ysclfbfb=rs.getDouble("clfbfb");
		yscfje=rs.getDouble("cfje");
		ysfwmjcz=rs.getDouble("fwmjcz");
		ysglk=rs.getDouble("ysglk");
	}
	rs.close();
	ps.close();

	clf=(ysglk-yscfje)*ysclfbfb/100+ysfwmjcz;
	clf=cf.round(clf,2);

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	//拆除金额
	if (!zjxxh.equals(""))
	{
		ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
		ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh";
		ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
		ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
		ls_sql+=" and bj_bjxmmxh.xmxlbm in('0101','0601')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (cfje<=400)
		{
			cfje=0;
		}
	}
	else{
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.xmxlbm in('0101','0601')";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		if (rs.next())
		{
			cfje=rs.getDouble(1);
		}
		rs.close();
		ps.close();
		if (cfje<=400)
		{
			cfje=0;
		}
	}

	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		ls_sql="select tcsgze ";
		ls_sql+=" from  crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("tcsgze");
		}
		rs.close();
		ps.close();

		if (!zjxxh.equals(""))
		{
			//1：工程类（与其它收费项目相关）；2：工程类（与其它收费项目无关）；3：主材类
			ls_sql="SELECT sum(bj_gclmxh.sl*bj_bjxmmxh.zqdj)";
			ls_sql+=" FROM bj_bjxmmxh,bj_gclmxh,bdm_xmdlbm";
			ls_sql+=" where bj_bjxmmxh.zjxxh='"+zjxxh+"'";
			ls_sql+=" and bj_bjxmmxh.xmdlbm=bdm_xmdlbm.xmdlbm and bdm_xmdlbm.sftsxm in('1','2')";
			ls_sql+=" and bj_bjxmmxh.zjxxh=bj_gclmxh.zjxxh and bj_bjxmmxh.xmbh=bj_gclmxh.xmbh";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				jsglk=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			jsglk=zqgczjf;
		}


		zjxje=cf.round(jsglk-zqgczjf,2);
	}
	else{
		jsglk=cf.round(zqgczjf+zjxje,2);
	}

	bcflk=cf.round((jsglk-cfje)*sgebfb/100+ysfwmjcz-clf,2);


	ls_sql="select zbj,rgfbfb";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgdzbj=rs.getDouble("zbj");
		rgfbfb=rs.getDouble("rgfbfb");
	}
	rs.close();
	ps.close();

	if (sgdzbj<=40000)
	{
		kzbjbl=4;
	}
	else if (sgdzbj>40000 && sgdzbj<=100000)
	{
		kzbjbl=3;
	}
	else if (sgdzbj>100000)
	{
		kzbjbl=0;
	}

	kzbj=cf.round(jsglk*kzbjbl/100,2);


	if (sgdzbj>=100000)
	{
		kzbj=0;
	}
	else if ((sgdzbj+kzbj)>=100000)
	{
		kzbj=100000-sgdzbj;
	}


	ls_sql="select sum(bcrgf)";
	ls_sql+=" from  cw_jrbgf";
	ls_sql+=" where khbh='"+khbh+"' and clzt!='3'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yfrgf=rs.getDouble(1);
	}
	rs.close();
	ps.close();

	bcrgf=cf.round(jsglk*rgfbfb/100+cfje*0.24-yfrgf,2);

	bcfkhj=bcrgf-kzbj;





	int count=0;
	ls_sql="select NVL(max(substr(jsjlh,8,2)),0)";
	ls_sql+=" from  cw_jrsgdjs";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jsjlh=khbh+cf.addZero(count+1,2);
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<div align="center">施工队完工结算</div>

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">结算记录号</td>
	<td  width="8%">预算工料款</td>
	<td  width="5%">人工费百分比</td>
	<td  width="8%">已付人工费</td>
	<td  width="8%">本次应付人工费</td>
	<td  width="7%">类型</td>
	<td  width="5%">处理状态</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="40%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="SELECT cw_jrbgf.jsjlh,TO_CHAR(cw_jrbgf.ysglk),cw_jrbgf.rgfbfb||'%',TO_CHAR(cw_jrbgf.yfrgf),cw_jrbgf.bcrgf,gdjsjdmc, DECODE(cw_jrbgf.clzt,'1','结算','2','审批同意','3','审批不同意'),cw_jrbgf.lrr,cw_jrbgf.lrsj,cw_jrbgf.bz ";
	ls_sql+=" FROM cw_jrbgf,dm_gdjsjd  ";
    ls_sql+=" where cw_jrbgf.lx=dm_gdjsjd.gdjsjd(+) and cw_jrbgf.khbh='"+khbh+"'";
	ls_sql+=" order by cw_jrbgf.jsjlh ";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDateSum();

%>
</table>

<form method="post" action="SaveInsertCw_jrsgdjs.jsp" name="insertform"  >
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户编号</font> </td>
    <td><%=khbh%> </td>
    <td align="right"><font color="#0000FF">合同号</font> </td>
    <td><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">客户姓名</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">质检姓名</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">房屋地址</font></td>
    <td><%=fwdz%> </td>
    <td align="right">套内建筑面积</td>
    <td><%=fwmj%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">施工队</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">施工班组</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">设计师</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">签约店面</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">签约日期</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><span class="STYLE1">报价级别</span></td>
    <td><%=bjjbmc%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">合同开工日期</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">合同竣工日期</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">实际开工日期</font></td>
    <td><%=sjkgrq%> </td>
    <td align="right"><font color="#0000FF">实际竣工日期</font></td>
    <td><%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="center" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2"><font color="#0000CC">结算记录号</font></span></td>
    <td><input type="text" name="jsjlh" value="<%=jsjlh%>" size="20" maxlength="9" readonly>    </td>
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">客户编号</font></span></td>
    <td><input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>    </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#FF0000">*</font><span class="STYLE2"><font color="#0000CC">施工队</font></span></td>
    <td><select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%>
      </select>    </td>
    <td align="right"><span class="STYLE2"><font color="#0000CC">现场负责人</font></span></td>
    <td><input type="text" name="sgbz" value="<%=sgbz%>" size="20" maxlength="20" readonly>    </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">预算工料款</span></td> 
  <td width="32%"><input type="text" name="ysglk" value="<%=ysglk%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">增减施工额</span></td> 
  <td width="32%"> 
    <input type="text" name="zjsge" value="<%=zjxje%>" size="20" maxlength="17" readonly>  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">拆除金额</span></td> 
  <td width="32%"> 
    <input type="text" name="cfje" value="<%=cfje%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font><span class="STYLE6">结算工料款</span></td>
  <td><input type="text" name="jsglk" value="<%=jsglk%>" size="20" maxlength="17" readonly></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>人工费百分比</td> 
  <td width="32%"><input type="text" name="rgfbfb" value="<%=rgfbfb%>" size="10" maxlength="9" onChange="calValue(insertform)">
    %</td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">已付人工费</span></td> 
  <td width="32%"><input type="text" name="yfrgf" value="<%=yfrgf%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">本次应付人工费</span></td> 
  <td width="32%"><input type="text" name="bcrgf" value="<%=bcrgf%>" size="20" maxlength="17" readonly></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">辅料款百分比</span></td> 
  <td width="32%"> 
    <input type="text" name="flkbfb" value="<%=sgebfb%>" size="10" maxlength="9" readonly>
    %  </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">已冲辅料款</span></td> 
  <td width="32%"> 
    <input type="text" name="ycflk" value="<%=clf%>" size="20" maxlength="17" readonly>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">本次应补退辅料款</span></td> 
  <td width="32%"> 
    <input type="text" name="bcflk" value="<%=bcflk%>" size="20" maxlength="17" readonly></td>
  <td width="18%" align="right"><font color="#FF0000">*</font>扣减辅料款</td> 
  <td width="32%"><input type="text" name="kjflk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>公司辅料</td>
  <td><input type="text" name="gsfl" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>配送辅料</td>
  <td><input type="text" name="psfl" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td height="28" align="right">施工队质保金</td>
  <td><%=sgdzbj%></td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">扣质保金比例</span></td> 
  <td width="32%"><p>
    <input type="text" name="kzbjbl" value="<%=kzbjbl%>" size="10" maxlength="9" readonly>
    % </p>    </td>
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">扣质保金</span></td> 
  <td width="32%"><input type="text" name="kzbj" value="<%=kzbj%>" size="20" maxlength="17" readonly></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>场地保险</td>
  <td><input type="text" name="bx" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>人员保险</td>
  <td><input type="text" name="rybx" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right"><font color="#FF0000">*</font>赔偿款</td>
  <td><input type="text" name="pck" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right"><font color="#FF0000">*</font>罚款</td>
  <td><input type="text" name="fk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font>扣其它款</td> 
  <td width="32%"><input type="text" name="kqtk" value="0" size="20" maxlength="17" onChange="calValue(insertform)"></td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">扣其它款说明</td> 
  <td colspan="3"> 
    <input type="text" name="kqtksm" value="" size="74" maxlength="200" >  </td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><font color="#FF0000">*</font><span class="STYLE6">本次付款合计</span></td> 
  <td colspan="3"> 
    <input type="text" name="bcfkhj" value="<%=cf.round(bcfkhj,0)%>" size="20" maxlength="17" readonly>
    <span class="STYLE6">本次付款合计</span><span class="STYLE6">=本次应付人工费-公司辅料-配送辅料-扣质保金-场地保险-人员保险-赔偿款-罚款-扣其它款</span></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1"><font color="#FF0000">*</font></span><span class="STYLE2">录入人</span></td>
  <td><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
  <td align="right"><font color="#FF0000">*</font><span class="STYLE2">录入时间</span></td>
  <td><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10"></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF"><font color="#FF0000">*</font><span class="STYLE2">录入部门</span></td>
  <td><select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
    <%
cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'","");
%>
  </select>  </td>
  <td align="right"><font color="#FF0000">*</font>拨付日期</td>
  <td><input type="text" name="jsrq" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)"></td>
</tr>

<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">备注</td> 
  <td colspan="3"> 
    <textarea name="bz" cols="72" rows="3"></textarea>    </td>
  </tr>
    <tr align="center"> 
      <td colspan="4"> 
	<input type="button"  value="存盘" onClick="f_do(insertform)">
	<input type="reset"  value="重输" name="reset">      </td>
    </tr>
</table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function calValue(FormName)
{  
	var bcflk=0;
	bcflk=(FormName.jsglk.value*1.0-FormName.cfje.value*1.0)*FormName.flkbfb.value/100+<%=ysfwmjcz%>-FormName.ycflk.value*1.0+FormName.kjflk.value*1.0;
	FormName.bcflk.value=round(bcflk,2);

	var bcrgf=FormName.jsglk.value/100*FormName.rgfbfb.value+FormName.cfje.value*0.24-FormName.yfrgf.value;
	FormName.bcrgf.value=round(bcrgf,2);

	var bcfkhj=FormName.bcrgf.value*1.0-FormName.gsfl.value*1.0-FormName.psfl.value*1.0-FormName.kzbj.value*1.0-FormName.kqtk.value*1.0-FormName.fk.value*1.0-FormName.bx.value*1.0-FormName.rybx.value*1.0-FormName.pck.value*1.0;
	FormName.bcfkhj.value=round(bcfkhj,0);

//	本次付款合计=本次应付人工费-公司辅料-配送辅料-扣质保金-场地保险-人员保险-赔偿款-罚款-扣其它款
	
} 
 
  
//bcrgf=cf.round(jsglk*rgfbfb/100+cfje*0.24-yfrgf,2);

//+FormName.bcflk.value*1.0

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.jsjlh)=="") {
		alert("请输入[结算记录号]！");
		FormName.jsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jsrq)=="") {
		alert("请输入[拨付日期]！");
		FormName.jsrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.jsrq, "拨付日期"))) {
		return false;
	}
	if(	javaTrim(FormName.ysglk)=="") {
		alert("请输入[预算工料款]！");
		FormName.ysglk.focus();
		return false;
	}
	if(!(isFloat(FormName.ysglk, "预算工料款"))) {
		return false;
	}
	if(	javaTrim(FormName.zjsge)=="") {
		alert("请输入[增减施工额]！");
		FormName.zjsge.focus();
		return false;
	}
	if(!(isFloat(FormName.zjsge, "增减施工额"))) {
		return false;
	}
	if(	javaTrim(FormName.cfje)=="") {
		alert("请输入[拆除金额]！");
		FormName.cfje.focus();
		return false;
	}
	if(!(isFloat(FormName.cfje, "拆除金额"))) {
		return false;
	}
	if(	javaTrim(FormName.jsglk)=="") {
		alert("请输入[结算工料款]！");
		FormName.jsglk.focus();
		return false;
	}
	if(!(isFloat(FormName.jsglk, "结算工料款"))) {
		return false;
	}
	if(	javaTrim(FormName.rgfbfb)=="") {
		alert("请输入[人工费百分比]！");
		FormName.rgfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.rgfbfb, "人工费百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.yfrgf)=="") {
		alert("请输入[已付人工费]！");
		FormName.yfrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.yfrgf, "已付人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.kjflk)=="") {
		alert("请输入[扣减辅料款]！");
		FormName.kjflk.focus();
		return false;
	}
	if(!(isFloat(FormName.kjflk, "扣减辅料款"))) {
		return false;
	}
	if(	javaTrim(FormName.bcrgf)=="") {
		alert("请输入[本次应付人工费]！");
		FormName.bcrgf.focus();
		return false;
	}
	if(!(isFloat(FormName.bcrgf, "本次应付人工费"))) {
		return false;
	}
	if(	javaTrim(FormName.flkbfb)=="") {
		alert("请输入[辅料款百分比]！");
		FormName.flkbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.flkbfb, "辅料款百分比"))) {
		return false;
	}
	if(	javaTrim(FormName.ycflk)=="") {
		alert("请输入[已冲辅料款]！");
		FormName.ycflk.focus();
		return false;
	}
	if(!(isFloat(FormName.ycflk, "已冲辅料款"))) {
		return false;
	}
	if(	javaTrim(FormName.bcflk)=="") {
		alert("请输入[本次应补退辅料款]！");
		FormName.bcflk.focus();
		return false;
	}
	if(!(isFloat(FormName.bcflk, "本次应补退辅料款"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfl)=="") {
		alert("请输入[公司辅料]！");
		FormName.gsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfl, "公司辅料"))) {
		return false;
	}
	if(	javaTrim(FormName.psfl)=="") {
		alert("请输入[配送辅料]！");
		FormName.psfl.focus();
		return false;
	}
	if(!(isFloat(FormName.psfl, "配送辅料"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbjbl)=="") {
		alert("请输入[扣质保金比例]！");
		FormName.kzbjbl.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbjbl, "扣质保金比例"))) {
		return false;
	}
	if(	javaTrim(FormName.kzbj)=="") {
		alert("请输入[扣质保金]！");
		FormName.kzbj.focus();
		return false;
	}
	if(!(isFloat(FormName.kzbj, "扣质保金"))) {
		return false;
	}
	if(	javaTrim(FormName.fk)=="") {
		alert("请输入[罚款]！");
		FormName.fk.focus();
		return false;
	}
	if(!(isFloat(FormName.fk, "罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.bx)=="") {
		alert("请输入[场地保险]！");
		FormName.bx.focus();
		return false;
	}
	if(!(isFloat(FormName.bx, "场地保险"))) {
		return false;
	}
	if(	javaTrim(FormName.rybx)=="") {
		alert("请输入[人员保险]！");
		FormName.rybx.focus();
		return false;
	}
	if(!(isFloat(FormName.rybx, "人员保险"))) {
		return false;
	}
	if(	javaTrim(FormName.pck)=="") {
		alert("请输入[赔偿款]！");
		FormName.pck.focus();
		return false;
	}
	if(!(isFloat(FormName.pck, "赔偿款"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("请输入[扣其它款]！");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "扣其它款"))) {
		return false;
	}
	if(	javaTrim(FormName.bcfkhj)=="") {
		alert("请输入[本次付款合计]！");
		FormName.bcfkhj.focus();
		return false;
	}
	if(!(isFloat(FormName.bcfkhj, "本次付款合计"))) {
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请选择[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
