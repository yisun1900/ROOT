<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");
String yhjs=(String)session.getAttribute("yhjs");

String ssfgs=null;
String dqbm=null;

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String hth=null;
String sjs=null;
double qye=0;
double wdzgce=0;
String sfyyh=null;
String yhyy=null;
String qyrq=null;
String kgrq=null;
String jgrq=null;
String hdbz=null;
String khlxbm=null;
String ybjbh=null;
String bz=null;
String bjjb=null;
double sjf=0;
double glf=0;
double guanlif=0;
double suijinbfb=0;
double suijin=0;

String cgdz=null;
String hdr=null;
String sfzhm=null;

String nlqjbm=null;
String zybm=null;
String fjfwbm=null;
double zkl=0;
double zjxzkl=0;
String czbm=null;

String xqbm=null;
String sffj=null;
String sfyrz=null;


String dwbh=null;
String jyjdrq=null;

String fjje=null;
String gsfje=null;
String cxhdbm=null;
String ywy=null;
String jzbz=null;
String sfcjq=null;
String sffby=null;
String sjsbh=null;

String hykh=null;
String hyklxbm=null;
String yxsjs=null;
String yxsjz=null;
String kgsjqd=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;
String sffk=null;
String djkh=null;
String fkrq=null;
String louhao=null;
String rzsc=null;
String zt=null;
double sfke=0;
String cxhdbmxq=null;
String cxhdbmzh=null;
String qtdh=null;
String email=null;
double zqguanlif=0;
String yjjzsj=null;
String tdyjjzsj=null;
String smhtbh=null;
String gqts=null;

double cdzwjmje=0;
double glfjmje=0;
double sjjmje=0;
double glfbfb=0;
double zqwjrqyexm=0;
double zhwjrqyexm=0;
String wjrqyexmsm=null;
String htshbz=null;


String dzbjjc="";//1：人工录入[折扣率、工程直接费－折前]，根据[折扣率、工程直接费－折前]自动计算[签约额]；2：人工录入[签约额、工程直接费－折前]，根据[签约额、工程直接费－折前]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程直接费－折前]，不自动计算4：必须做电子报价，[工程直接费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程直接费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
double sjjryjbfb=0;
double sssjf=0;

String shbz="";
String shdzbjjc="";//1：人工录入[折扣率、工程直接费－折前]，根据[折扣率、工程直接费－折前]自动计算[签约额]；2：人工录入[签约额、工程直接费－折前]，根据[签约额、工程直接费－折前]自动计算[折扣率] ；3：全部人工录入[折扣率、签约额、工程直接费－折前]，不自动计算4：必须做电子报价，[工程直接费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，5：必须做电子报价，[工程直接费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]

String hdsgd=null;
String hdsgbz=null;

double zqqyze=0;
double zhqyze=0;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select hdsgd,hdsgbz,gqts,smhtbh,yjjzsj,tdyjjzsj,zqguanlif,email,qtdh,cxhdbmxq,cxhdbmzh,fgsbh,sfke,guanlif,suijinbfb,suijin,zt,rzsc,louhao,sffk,djkh,fkrq,ysrbm,rddqbm,hxwzbm,kgsjqd,hykh,hyklxbm,yxsjs,yxsjz,sfcjq,sffby,jzbz,wdzgce,glf,sjf,ywy,bjjb,dwbh,khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,qyrq,kgrq,hdbz,khlxbm,bz,jgrq,ybjbh,cgdz,hdr,sfzhm,nlqjbm,zybm,fjfwbm,zkl,zjxzkl,czbm,xqbm,sffj,sfyrz,jyjdrq,fjje,gsfje,cxhdbm,sjsbh ";
	ls_sql+=" ,cdzwjmje,glfjmje,sjjmje,glfbfb,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,htshbz ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		glfbfb=rs.getDouble("glfbfb");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillNull(rs.getString("wjrqyexmsm"));
		htshbz=cf.fillNull(rs.getString("htshbz"));

		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		gqts=cf.fillNull(rs.getString("gqts"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		yjjzsj=cf.fillNull(rs.getDate("yjjzsj"));
		tdyjjzsj=cf.fillNull(rs.getDate("tdyjjzsj"));
		zqguanlif=rs.getDouble("zqguanlif");
		email=cf.fillNull(rs.getString("email"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		ssfgs=rs.getString("fgsbh");
		sfke=rs.getDouble("sfke");
		guanlif=rs.getDouble("guanlif");
		suijinbfb=rs.getDouble("suijinbfb");
		suijin=rs.getDouble("suijin");
		zt=cf.fillNull(rs.getString("zt"));
		rzsc=cf.fillNull(rs.getString("rzsc"));
		louhao=cf.fillNull(rs.getString("louhao"));
		sffk=cf.fillNull(rs.getString("sffk"));
		djkh=cf.fillNull(rs.getString("djkh"));
		fkrq=cf.fillNull(rs.getDate("fkrq"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		kgsjqd=cf.fillNull(rs.getString("kgsjqd"));
		hykh=cf.fillNull(rs.getString("hykh"));
		hyklxbm=cf.fillNull(rs.getString("hyklxbm"));
		yxsjs=cf.fillNull(rs.getDate("yxsjs"));
		yxsjz=cf.fillNull(rs.getDate("yxsjz"));

		sfcjq=cf.fillNull(rs.getString("sfcjq"));
		sffby=cf.fillNull(rs.getString("sffby"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		wdzgce=rs.getDouble("wdzgce");
		glf=rs.getDouble("glf");
		sjf=rs.getDouble("sjf");
		ywy=cf.fillNull(rs.getString("ywy"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=rs.getDouble("qye");
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		zkl=rs.getDouble("zkl");
		zjxzkl=rs.getDouble("zjxzkl");
	
		xqbm=cf.fillNull(rs.getString("xqbm"));
		sffj=cf.fillNull(rs.getString("sffj"));
		sfyrz=cf.fillNull(rs.getString("sfyrz"));
	
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));

		fjje=cf.fillNull(rs.getString("fjje"));
		gsfje=cf.fillNull(rs.getString("gsfje"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
	}
	rs.close();
	ps.close();

	if (kgsjqd==null || kgsjqd.equals(""))//开工时间确定
	{
		kgsjqd="Y";
	}

	if (!yjjzsj.equals("") || !tdyjjzsj.equals(""))
	{
		out.println("错误！业绩已结转，不能再修改");
		return;
	}

	if (sfke!=0)
	{
		out.println("错误！财务已收款，不能再修改，若需修改，1、可先删除收款信息，2、或在【维护工程信息】下【修改－签单基本信息】中完成");
		return;
	}

	if (!htshbz.equals("N"))
	{
		out.println("错误！合同已审核，不能再修改");
		return;
	}

	zqqyze=wdzgce+zqguanlif+suijin+zqwjrqyexm;
	zqqyze=cf.round(zqqyze,2);
	zhqyze=qye+guanlif+suijin+zhwjrqyexm;
	zhqyze=cf.round(zhqyze,2);




	ls_sql="SELECT dqbm,dzbjjc,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查

		sjjryjbfb=rs.getDouble("sjjryjbfb");//设计客户计入业绩收款比例 

	}
	rs.close();
	ps.close();


	ls_sql="select sjf,shbz,dzbjjc";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sssjf=rs.getDouble("sjf");
		shbz=cf.fillNull(rs.getString("shbz"));
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//启用电子报价检查
	}
	rs.close();
	ps.close();

	if (shbz.equals("Y"))//信息审核标志
	{
		dzbjjc=shdzbjjc;
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
		if (ps!= null) ps.close(); 
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

<body bgcolor="#CCCCFF">
<form method="post" action="" name="insertform" target="_blank">
      <div align="center"> 请修改信息（客户编号：<%=khbh%>）（<font color="#FF0033">*</font>为必填字段）</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">合同号</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>书面合同编号</td>
      <td width="31%"><input type="text" name="smhtbh" value="<%=smhtbh%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">客户姓名</font>      </td>
      <td width="34%"><%=khxm%> 
      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>性别      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        男 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        女 </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>手机</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">用于接收短信，最好录一部,有多个电话<font color="#0000FF">用英文逗号</font>分隔</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">其它电话</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(注意：有多个电话<font color="#0000FF">用英文逗号</font>分隔)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">电子邮件</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">业主身份证号码</td>
      <td width="31%">
        <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">房屋地址</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">所属热点地区</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">所属环线位置</td>
      <td width="31%"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">年龄区间</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">职业</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">月收入</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">房价（元/m）</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">设计师</font>      </td>
      <td width="34%"><%=sjs%></td>
      <td width="19%" align="right"> 
        <font color="#0000FF">业务员</font>      </td>
      <td width="31%"><%=ywy%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>房屋面积      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>"  onChange="calValue(insertform)" >
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"> <font color="#FF0033">*</font>报价级别</td>
      <td width="31%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}
%></td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程直接费－折前]，根据[折扣率、工程直接费－折前]自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
%</td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程直接费－折前]，根据[签约额、工程直接费－折前]自动计算[折扣率]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
%</td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、工程直接费－折前]，不自动计算
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%"><input type="hidden" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  >
      <input name="glfjmje2" type="hidden" value="<%=glfjmje%>" size="20" maxlength="16" >
      <input name="sjjmje2" type="hidden" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>管理费－折前</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费－折后</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>税金</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>其它收费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("6"))//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折前</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>工程直接费－折后</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费百分比</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>管理费－折前</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>管理费－折后</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>税金百分比</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>税金</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>其它收费－折前</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>其它收费－折后</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它收费项目</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("4"))//4：必须做电子报价，[工程直接费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">是否有优惠</font></td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh,true);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">优惠内容</font></td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">增减项折扣</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("7"))//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">合同折扣</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">增减项折扣</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程直接费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">签约总额－折前</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">签约总额－折后</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否有优惠</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+是&N+否",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">优惠内容</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>合同折扣</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
      <td align="right"><font color="#FF0033">*</font>增减项折扣</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">（>0且<=10）</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折前</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工程减免额</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">工程直接费－折后</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费百分比</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折前</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">管理费－折后</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金百分比</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">税金</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>管理费减免额</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>税金减免额</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折前</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">其它收费－折后</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">其它收费项目</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else{
		out.println("『启用电子报价检查』错误！"+dzbjjc);
		return;
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>设计费</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="16"  onKeyUp="keyGo(glf)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>服务费</td>
      <td width="31%"> 
        <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">          </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否返券</td>
      <td width="34%"><%
	cf.radioToken(out, "sffj","Y+是&N+否",sffj);
%></td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">返券总金额</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="<%=fjje%>" size="20" maxlength="20" >
      </td>
      <td width="19%" align="right">公司承担返卷额</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="<%=gsfje%>" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>是否已认证</td>
      <td width="34%"><%
	cf.radioToken(out, "sfyrz","Y+是&N+否",sfyrz);
%> </td>
      <td width="19%" align="right">认证市场</td>
      <td width="31%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh",rzsc);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">参加公司促销活动</font></td>
      <td colspan="3"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">参加小区促销活动</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">参加展会促销活动</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#CC0000">*</font>家装标志</td>
      <td width="34%" height="14"><%
	cf.radioToken(out, "jzbz","1+家装&2+公装",jzbz);
%> </td>
      <td width="19%" rowspan="5" align="right"> 
        <font color="#FF0033">*</font>信息来源      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='1' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="14" align="right"> 
        <font color="#FF0033">*</font>户型      </td>
      <td width="34%" height="14">
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font>风格</td>
      <td width="34%" height="10">
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font>油色</td>
      <td width="34%" height="10">
        <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" height="10">材质</td>
      <td width="34%" height="10">
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm);
%> 
        </select>
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">开工时间</td>
      <td width="34%"><%
	cf.radioToken(out, "kgsjqd","Y+已确定&N+未确定",kgsjqd);
%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>工期天数</td>
      <td width="31%"><input type="text" name="gqts" size="20" maxlength="10"  value="<%=gqts%>"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>建议交底日期      </td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="<%=jyjdrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>签约日期      </td>
      <td width="31%"> 
        <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>合同开工日期      </td>
      <td width="34%"> 
        <input type="text" name="kgrq" size="20" maxlength="10"  value="<%=kgrq%>" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>合同竣工日期      </td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10"  value="<%=jgrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>回单标志      </td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)">
          <%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz);
%> 
        </select>      </td>
      <td width="19%" align="right"> 
        回单人      </td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">回单工地队长</td>
      <td><input type="text" name="hdsgd" value="<%=hdsgd%>" size="20" maxlength="20"  ></td>
      <td align="right">回单工地班长</td>
      <td><input type="text" name="hdsgbz" value="<%=hdsgbz%>" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">回单装修地址</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">水质分析卡是否发放</td>
      <td width="34%"><%
	cf.radioToken(out, "sffk","Y+发卡&N+未发卡",sffk);
%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>关系客户</td>
      <td width="31%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">普通客户</option>");
	}
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">登记卡号</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="<%=djkh%>" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">发卡日期</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="<%=fkrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
          <input type="button"  value="保存" onClick="f_do(insertform)">
          <input type="reset"  value="重输">
          <input type="button"  value="电子报价打印预览" onClick="f_ck(insertform)" name="ck" >
          <input type="hidden" name="sfcjq" value="<%=sfcjq%>" size="20" maxlength="10" >
          <input type="hidden" name="sffby" value="<%=sffby%>" size="20" maxlength="10" >
          <input type="hidden" name="hykh" value="<%=hykh%>" size="20" maxlength="8" >
          <input type="hidden" name="hyklxbm" value="<%=hyklxbm%>" size="20" maxlength="10" >
          <input type="hidden" name="yxsjs" value="<%=yxsjs%>" size="20" maxlength="10" >
          <input type="hidden" name="yxsjz" value="<%=yxsjz%>" size="20" maxlength="10" >
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	<%
	if (dzbjjc.equals("1"))//1：人工录入[折扣率、工程费－折前]，根据[折扣率、工程费－折前]自动计算[签约额]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;


		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  
		
		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      


		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      
		
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("2"))//2：人工录入[签约额、工程费－折前]，根据[签约额、工程费－折前]自动计算[折扣率]
	{
		%>
		var yqye=FormName.qye.value*1.0+FormName.cdzwjmje.value*1.0;
		var zkl=yqye*10.0/FormName.wdzgce.value;
		zkl=round(zkl,2);
		FormName.zkl.value=zkl;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("3"))//3：全部人工录入[折扣率、签约额、工程费－折前]，不自动计算
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("6"))//6：全部人工录入[折扣率、签约额、合同原报价] ，不自动计算，记录减免
	{
		%>
		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("4"))//4：必须做电子报价，[工程费－折前]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改
	{
		%>
		var qye=<%=(qye+cdzwjmje)%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=(guanlif+glfjmje)%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=(suijin+sjjmje)%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("7"))//7：必须做电子报价，[合同原报价]取自电子报价，[折扣率]取自审批，自动计算[签约额]，不可改，可修改其它优惠
	{
		%>
		var qye=<%=(qye+cdzwjmje)%>-FormName.cdzwjmje.value*1.0;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var guanlif=<%=(guanlif+glfjmje)%>-FormName.glfjmje.value*1.0;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;

		var suijin=<%=(suijin+sjjmje)%>-FormName.sjjmje.value*1.0;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	else if (dzbjjc.equals("5"))//5：必须做电子报价，[工程费－折前]取自电子报价不可改，人工录入[折扣率]，自动计算[签约额]
	{
		%>
		var yqye=FormName.wdzgce.value/10.0*FormName.zkl.value;
		yqye=round(yqye,2);

		var qye=yqye-FormName.cdzwjmje.value;
		qye=round(qye,2);
		FormName.qye.value=qye;

		var zqguanlif=FormName.wdzgce.value*FormName.glfbfb.value/100.0;
		FormName.zqguanlif.value=round(zqguanlif,2);  

		var yguanlif=FormName.zkl.value/10.0*FormName.zqguanlif.value;
		yguanlif=round(yguanlif,2);

		var guanlif=yguanlif-FormName.glfjmje.value;
		guanlif=round(guanlif,2);
		FormName.guanlif.value=guanlif;      

		var suijin=(yqye+yguanlif)*FormName.suijinbfb.value/100.0-FormName.sjjmje.value;
		suijin=round(suijin,2);
		FormName.suijin.value=suijin;     

		var zhwjrqyexm=FormName.zkl.value/10.0*FormName.zqwjrqyexm.value;
		FormName.zhwjrqyexm.value=round(zhwjrqyexm,2);      

		var zqqyze=FormName.wdzgce.value*1.0+FormName.zqguanlif.value*1.0+FormName.suijin.value*1.0+FormName.zqwjrqyexm.value*1.0;
		zqqyze=round(zqqyze,2);
		FormName.zqqyze.value=zqqyze;     

		var zhqyze=FormName.qye.value*1.0+FormName.guanlif.value*1.0+FormName.suijin.value*1.0+FormName.zhwjrqyexm.value*1.0;
		zhqyze=round(zhqyze,2);
		FormName.zhqyze.value=zhqyze;     
		<%
	}
	%>
	
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    



function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单;5：员工回单
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

/*
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("请输入[书面合同编号]！");
		FormName.smhtbh.focus();
		return false;
	}
*/
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("请选择[报价级别]！");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("请输入[报价级别]！");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	!radioChecked(FormName.xb)) {
		alert("请选择[性别]！");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("请输入[手机]或[其它电话]！");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "手机"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "其它电话"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "电子邮件"))) {
		return false;
	}


<%
	if (ssfgs.equals("FBJ00"))
	{
		%>

		/*
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("请输入[身份证号码]！");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "身份证号码"))) {
			return false;
		}
		if(	!radioChecked(FormName.sffk)) {
			alert("请选择[水质分析卡是否发放]！");
			FormName.sffk[0].focus();
			return false;
		}
*/
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("请输入[登记卡号]！");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("请输入[发卡日期]！");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "发卡日期"))) {
				return false;
			}
		}
		else{
			FormName.djkh.value="";
			FormName.fkrq.value="";
		}
		<%
	}
%>
	
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("请选择[关系客户]！");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("请输入[信息来源]！");
		FormName.xxlybm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("请输入[户型]！");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("请输入[风格分类]！");
		FormName.fgflbm.focus();
		return false;
	}


	if(	javaTrim(FormName.ysbm)=="") {
		alert("请输入[油色]！");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("请输入[面积]！");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "面积"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[面积]不能为0！");
		FormName.fwmj.select();
		return false;
	}

	if(	!radioChecked(FormName.sfyyh)) {
		alert("请选择[是否有优惠]！");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("请输入[优惠内容]！");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhyy)!="") {
			alert("您选择了无优惠,请删除[优惠内容]！");
			FormName.yhyy.select();
			return false;
		}
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[工程直接费－折前]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程直接费－折前"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[工程直接费－折前]不能为0！");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[工程直接费－折前]不能小于[工程直接费－折后]！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程直接费－折后]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程直接费－折后"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[工程直接费－折后]不能为0！");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[合同折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "合同折扣率"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("错误！[合同折扣率]应该在0和10之间！");
		FormName.zkl.select();
		return false;
	}
	if(	javaTrim(FormName.zjxzkl)=="") {
		alert("请输入[增减项折扣率]！");
		FormName.zjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "增减项折扣率"))) {
		return false;
	}
	if (FormName.zjxzkl.value<0 || FormName.zjxzkl.value>10)
	{
		alert("错误！[增减项折扣率]应该在0和10之间！");
		FormName.zjxzkl.select();
		return false;
	}


	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("请输入[工程减免额]！");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "工程减免额"))) {
		return false;
	}

/*	
	if (FormName.cdzwjmje.value<0 || FormName.cdzwjmje.value>100)
	{
		alert("错误！[工程减免额]应该在0和100之间！");
		FormName.cdzwjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("请输入[管理费减免额]！");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "管理费减免额"))) {
		return false;
	}

/*	
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("错误！[管理费减免额]应该在0和100之间！");
		FormName.glfjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("请输入[税金减免额]！");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "税金减免额"))) {
		return false;
	}

/*	
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("错误！[税金减免额]应该在0和100之间！");
		FormName.sjjmje.select();
		return false;
	}
*/

	if(	javaTrim(FormName.sjf)=="") {
		alert("请输入[设计费]！");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "设计费"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("请输入[税金百分比]！");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "税金百分比"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("错误！[税金百分比]应该在0和100之间！");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("请输入[税金]！");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("请输入[服务费]！");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "服务费"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("请输入[管理费百分比]！");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "管理费百分比"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("错误！[管理费百分比]应该在0和100之间！");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("请输入[折前管理费]！");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "折前管理费"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("请输入[折后管理费]！");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "折后管理费"))) {
		return false;
	}

	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("请输入[折前其它收费－折前]！");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "折前其它收费－折前"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("请输入[折后其它收费－折前]！");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "折后其它收费－折前"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("请输入[其它收费项目]！");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("请输入[每平米均价]！");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "每平米均价"))) {
		return false;
	}



	if(	!radioChecked(FormName.sffj)) {
		alert("请选择[是否返券]！");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("请输入[返卷总金额]！");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "返卷总金额"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("请输入[公司承担返卷额]！");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "公司承担返卷额"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[返卷总金额]不能小于[公司承担返卷额]！");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("请选择[是否已认证]！");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("请输入[认证市场]！");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("请输入[签约日期]！");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "签约日期"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[签约日期]不能大于[今天]！");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("请输入[建议交底日期]！");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "建议交底日期"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("请输入[合同开工日期]！");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "合同开工日期"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("请输入[合同竣工日期]！");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "合同竣工日期"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[建议交底日期]应大于[签约日期]！");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[合同开工日期]应大于[建议交底日期]！");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[合同竣工日期]应大于[合同开工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[建议交底日期]！");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同开工日期]！");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[开工时间]未确定，不能录入[合同竣工日期]！");
			FormName.jgrq.select();
			return false;
		}
	}



	if(	javaTrim(FormName.hdbz)=="") {
		alert("请选择[回单标志]！");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1：非回单； 2：设计师回单；3：施工队回单；4：老客户回单
		FormName.cgdz.value="";
		FormName.hdr.value="";
		FormName.hdsgd.value="";
		FormName.hdsgbz.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
		FormName.hdsgd.disabled=true;
		FormName.hdsgbz.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("请输入[回单装修地址]！");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("请输入[回单人]！");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("请输入[回单工地队长]！");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("请输入[回单工地班长]！");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(!(isDatetime(FormName.yxsjs, "会员有效时间始"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "会员有效时间止"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("请选择[家装标志]！");
		FormName.jzbz[0].focus();
		return false;
	}

	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("『设计费』录入错误！实收设计费『<%=sssjf%>』未达到公司实收标准『<%=sjjryjbfb%>』%规定");
		FormName.sjf.select();
		return false;
	}

	if(	javaTrim(FormName.gqts)=="") {
		alert("请选择[工期天数]！");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "工期天数"))) {
		return false;
	}

	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();

	return true;
}

function f_ck(FormName)//参数FormName:Form的名称
{

	FormName.action="/dzbj/zxbjmx/Bj_khbjmxDyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
 
</CENTER>
</body>
</html>


