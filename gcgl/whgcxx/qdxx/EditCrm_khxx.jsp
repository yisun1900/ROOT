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
String qye=null;
String wdzgce=null;
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



String hdsgd=null;
String hdsgbz=null;
String khjl=null;
String xxlysm=null;
String fkfabm="";
int fkfssl=0;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select hdsgd,hdsgbz,gqts,smhtbh,yjjzsj,tdyjjzsj,zqguanlif,email,qtdh,cxhdbmxq,cxhdbmzh,fgsbh,sfke,guanlif,suijinbfb,suijin,zt,rzsc,louhao,sffk,djkh,fkrq,ysrbm,rddqbm,hxwzbm,kgsjqd,hykh,hyklxbm,yxsjs,yxsjz,sfcjq,sffby,jzbz,wdzgce,glf,sjf,ywy,bjjb,dwbh,khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,qyrq,kgrq,hdbz,khlxbm,bz,jgrq,ybjbh,cgdz,hdr,sfzhm,nlqjbm,zybm,fjfwbm,zkl,czbm,xqbm,sffj,sfyrz,jyjdrq,fjje,gsfje,cxhdbm,sjsbh ";
	ls_sql+=" ,cdzwjmje,glfjmje,sjjmje,glfbfb,zqwjrqyexm,zhwjrqyexm,wjrqyexmsm,zjxzkl,khjl,xxlysm ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		xxlysm=cf.fillNull(rs.getString("xxlysm"));
		cdzwjmje=rs.getDouble("cdzwjmje");
		glfjmje=rs.getDouble("glfjmje");
		sjjmje=rs.getDouble("sjjmje");
		glfbfb=rs.getDouble("glfbfb");
		zqwjrqyexm=rs.getDouble("zqwjrqyexm");
		zhwjrqyexm=rs.getDouble("zhwjrqyexm");
		wjrqyexmsm=cf.fillHtml(rs.getString("wjrqyexmsm"));
		zjxzkl=rs.getDouble("zjxzkl");

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
		wdzgce=cf.fillNull(rs.getString("wdzgce"));
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
		qye=cf.fillNull(rs.getString("qye"));
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

	if (kgsjqd==null || kgsjqd.equals(""))//����ʱ��ȷ��
	{
		kgsjqd="Y";
	}



	ls_sql="SELECT count(*)";
	ls_sql+=" FROM cw_fgsfkfa";
    ls_sql+=" where fgsbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfssl=rs.getInt(1);
	}
	rs.close();
	ps.close();

	if (fkfssl==0)
	{
		out.println("����û�и��ʽ������ϵϵͳ����Ա");
		return;
	}

	ls_sql="SELECT fkfabm";
	ls_sql+=" FROM cw_khfkfa";
    ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fkfabm=cf.fillNull(rs.getString("fkfabm"));
	}
	rs.close();
	ps.close();



	ls_sql="SELECT dqbm,dzbjjc,sjjryjbfb";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));

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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#CCCCFF">
<form method="post" action="" name="insertform" >
      <div align="center"> ���޸���Ϣ���ͻ���ţ�<%=khbh%>����<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">��ͬ��</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#0000FF">�����ͬ���</font></td>
      <td width="31%"><%=smhtbh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"><%=khxm%>      </td>
      <td width="19%" align="right"><font color="#0000FF">�Ա�      </font></td>
      <td width="31%">
<%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%>	  </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ֻ�</font></td>
      <td colspan="3"> <%=lxfs%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����绰</font></td>
      <td colspan="3"> <%=qtdh%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�����ʼ�</font></td>
      <td width="34%"> <%=email%></td>
      <td width="19%" align="right"><font color="#0000FF">ҵ�����֤����</font></td>
      <td width="31%"><%=sfzhm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��������</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>      </td>
      <td width="19%" align="right">ְҵ</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">������</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>      </td>
      <td width="19%" align="right">���ۣ�Ԫ/m��</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">���ʦ</font>      </td>
      <td width="34%"><%=sjs%></td>
      <td width="19%" align="right"> 
        <font color="#0000FF">ҵ��Ա</font>      </td>
      <td width="31%"><%=ywy%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�ͻ�����</font></td>
      <td><%=khjl%></td>
      <td align="right"><font color="#FF0033">*</font>�����</td>
      <td><select name="fkfabm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	if (fkfssl==1)
	{
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm",fkfabm);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select cw_fkfabm.fkfabm,cw_fkfabm.fkfamc from cw_fkfabm,cw_fgsfkfa where cw_fkfabm.fkfabm=cw_fgsfkfa.fkfabm and cw_fgsfkfa.fgsbh='"+ssfgs+"' order by cw_fkfabm.fkfabm",fkfabm);
	}

%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>�������      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>"  >      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><%=zkl%></td>
      <td align="right"><font color="#0000FF">�������ۿ�</font></td>
      <td><%=zjxzkl%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">����ԭ����</font></td>
      <td width="34%"> <%=wdzgce%></td>
      <td width="19%" align="right"><font color="#0000FF">��ͬ�����</font></td>
      <td width="31%"><%=cdzwjmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">����ǩԼ��</font></td>
      <td width="34%"> <%=qye%></td>
      <td width="19%" align="right"><font color="#0000FF">����Ѱٷֱ�</font></td>
      <td width="31%"><%=glfbfb%>      %</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%"> <%=zqguanlif%></td>
      <td width="19%" align="right"><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> <%=guanlif%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><%=suijinbfb%> % </td>
      <td width="19%" align="right"><font color="#0000FF">˰��</font></td>
      <td width="31%"> <%=suijin%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">����Ѽ����</font></td>
      <td><%=glfjmje%></td>
      <td align="right"><font color="#0000FF">˰������</font></td>
      <td><%=sjjmje%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">δ����ǩԼ���</font></td>
      <td><%=zqwjrqyexm%><font color="#0000FF"><strong>����ǰ��</strong></font></td>
      <td align="right"><font color="#0000FF">δ����ǩԼ���</font></td>
      <td><%=zhwjrqyexm%><strong><font color="#0000FF">���ۺ�</font></strong></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">δ����ǩԼ����Ŀ</font></td>
      <td colspan="3"><%=wjrqyexmsm%></td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">��Ʒ�</font></td>
      <td width="34%"> <%=sjf%></td>
      <td width="19%" align="right"><font color="#0000FF">�����</font></td>
      <td width="31%"> <%=glf%></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�ȯ</td>
      <td width="34%"><%
	cf.radioToken(out, "sffj","Y+��&N+��",sffj);
%></td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ȯ�ܽ��</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="<%=fjje%>" size="20" maxlength="20" >
      </td>
      <td width="19%" align="right">��˾�е������</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="<%=gsfje%>" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�����֤</td>
      <td width="34%"><%
	cf.radioToken(out, "sfyrz","Y+��&N+��",sfyrz);
%> </td>
      <td width="19%" align="right">��֤�г�</td>
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
      <td width="16%" align="right"><font color="#0000FF">�μӹ�˾�����</font></td>
      <td colspan="3"><%=cxhdbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�μ�С�������</font></td>
      <td colspan="3"><%=cxhdbmxq%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�μ�չ������</font></td>
      <td colspan="3"><%=cxhdbmzh%></td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="14" align="right"><font color="#CC0000">*</font>��װ��־</td>
      <td width="34%" height="14"><%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%> </td>
      <td width="19%" rowspan="5" align="right"> 
        <font color="#FF0033">*</font>��Ϣ��Դ      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" height="14" align="right"> 
        <font color="#FF0033">*</font>����      </td>
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
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font>���</td>
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
      <td width="16%" align="right" height="10"><font color="#FF0033">*</font>��ɫ</td>
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
      <td width="16%" align="right" height="10">����</td>
      <td width="34%" height="10">
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm",czbm);
%> 
        </select>
      </td>
    </tr>
      <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��Ϣ��Դ˵��</td>
      <td colspan="3"><input name="xxlysm" type="text" value="<%=xxlysm%>" size="73" maxlength="100"></td>
    </tr>
 </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����ʱ��</td>
      <td width="34%"><%
	cf.radioToken(out, "kgsjqd","Y+��ȷ��&N+δȷ��",kgsjqd);
%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��������</td>
      <td width="31%"><input type="text" name="gqts" size="20" maxlength="10"  value="<%=gqts%>"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>���齻������      </td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="<%=jyjdrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>ǩԼ����      </td>
      <td width="31%"> 
        <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>��ͬ��������      </td>
      <td width="34%"> 
        <input type="text" name="kgrq" size="20" maxlength="10"  value="<%=kgrq%>" onDblClick="JSCalendar(this)">      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>��ͬ��������      </td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10"  value="<%=jgrq%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>�ص���־      </td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)">
<%
	cf.selectItem(out,"select hdlxbm,hdlxmc from dm_hdlxbm order by hdlxbm",hdbz);
%>
        </select>      </td>
      <td width="19%" align="right"> 
        �ص���      </td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�ص����ضӳ�</td>
      <td><input type="text" name="hdsgd" value="<%=hdsgd%>" size="20" maxlength="20"  ></td>
      <td align="right">�ص����ذ೤</td>
      <td><input type="text" name="hdsgbz" value="<%=hdsgbz%>" size="20" maxlength="20"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�ص�װ�޵�ַ</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" >      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
      <td width="34%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
        <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">��ͨ�ͻ�</option>");
	}
%>
      </select></td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2"><%=bz%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4" height="2"> 
        <div align="center"> 
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="ssfgs"  value="<%=ssfgs%>" >
          <input type="button"  value="����" onClick="f_do(insertform)">
          <input type="reset"  value="����">
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


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
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

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.fkfabm)=="") {
		alert("������[�����]��");
		FormName.fkfabm.focus();
		return false;
	}


	
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("������[��Ϣ��Դ]��");
		FormName.xxlybm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}


	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[���]����Ϊ0��");
		FormName.fwmj.select();
		return false;
	}



	if(	!radioChecked(FormName.sffj)) {
		alert("��ѡ��[�Ƿ�ȯ]��");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("������[�����ܽ��]��");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "�����ܽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("������[��˾�е������]��");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "��˾�е������"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[�����ܽ��]����С��[��˾�е������]��");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("��ѡ��[�Ƿ�����֤]��");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("������[��֤�г�]��");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[ǩԼ����]���ܴ���[����]��");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("������[���齻������]��");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "��ͬ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "��ͬ��������"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[���齻������]Ӧ����[ǩԼ����]��");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[���齻������]��");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[���齻������]��");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}



	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
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
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}



	if(	javaTrim(FormName.gqts)=="") {
		alert("��ѡ��[��������]��");
		FormName.gqts.focus();
		return false;
	}
	if(!(isNumber(FormName.gqts, "��������"))) {
		return false;
	}


	FormName.action="SaveEditCrm_khxx.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
