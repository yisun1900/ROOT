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


String dzbjjc="";//1���˹�¼��[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]������[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ�����ֱ�ӷѣ���ǰ]������[ǩԼ�����ֱ�ӷѣ���ǰ]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ֱ�ӷѣ���ǰ]�����Զ�����4�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
double sjjryjbfb=0;
double sssjf=0;

String shbz="";
String shdzbjjc="";//1���˹�¼��[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]������[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]�Զ�����[ǩԼ��]��2���˹�¼��[ǩԼ�����ֱ�ӷѣ���ǰ]������[ǩԼ�����ֱ�ӷѣ���ǰ]�Զ�����[�ۿ���] ��3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ֱ�ӷѣ���ǰ]�����Զ�����4�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ�5�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]

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

	if (kgsjqd==null || kgsjqd.equals(""))//����ʱ��ȷ��
	{
		kgsjqd="Y";
	}

	if (!yjjzsj.equals("") || !tdyjjzsj.equals(""))
	{
		out.println("����ҵ���ѽ�ת���������޸�");
		return;
	}

	if (sfke!=0)
	{
		out.println("���󣡲������տ�������޸ģ������޸ģ�1������ɾ���տ���Ϣ��2�����ڡ�ά��������Ϣ���¡��޸ģ�ǩ��������Ϣ�������");
		return;
	}

	if (!htshbz.equals("N"))
	{
		out.println("���󣡺�ͬ����ˣ��������޸�");
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
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��

		sjjryjbfb=rs.getDouble("sjjryjbfb");//��ƿͻ�����ҵ���տ���� 

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
		shdzbjjc=cf.fillNull(rs.getString("dzbjjc"));//���õ��ӱ��ۼ��
	}
	rs.close();
	ps.close();

	if (shbz.equals("Y"))//��Ϣ��˱�־
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#CCCCFF">
<form method="post" action="" name="insertform" target="_blank">
      <div align="center"> ���޸���Ϣ���ͻ���ţ�<%=khbh%>����<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">��ͬ��</font></td>
      <td width="34%"><%=hth%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�����ͬ���</td>
      <td width="31%"><input type="text" name="smhtbh" value="<%=smhtbh%>" size="20" maxlength="20" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�ͻ�����</font>      </td>
      <td width="34%"><%=khxm%> 
      </td>
      <td width="19%" align="right"> 
        <font color="#FF0033">*</font>�Ա�      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        �� 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ֻ�</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����绰</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ʼ�</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">ҵ�����֤����</td>
      <td width="31%">
        <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">���ݵ�ַ</font>      </td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
  </TABLE>

<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ȵ����</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">��������λ��</td>
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
      <td width="16%" align="right">��������</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">ְҵ</td>
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
      <td width="16%" align="right">������</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">���ۣ�Ԫ/m��</td>
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
      <td width="16%" align="right"><font color="#0000FF">���ʦ</font>      </td>
      <td width="34%"><%=sjs%></td>
      <td width="19%" align="right"> 
        <font color="#0000FF">ҵ��Ա</font>      </td>
      <td width="31%"><%=ywy%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"> 
        <font color="#FF0033">*</font>�������      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>"  onChange="calValue(insertform)" >
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"> <font color="#FF0033">*</font>���ۼ���</td>
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
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]������[�ۿ��ʡ�����ֱ�ӷѣ���ǰ]�Զ�����[ǩԼ��]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
%</td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ�����ֱ�ӷѣ���ǰ]������[ǩԼ�����ֱ�ӷѣ���ǰ]�Զ�����[�ۿ���]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)" >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" onChange="calValue(insertform)">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" onChange="calValue(insertform)" >
%</td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("3"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ�����ֱ�ӷѣ���ǰ]�����Զ�����
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%"><input type="hidden" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  >
      <input name="glfjmje2" type="hidden" value="<%=glfjmje%>" size="20" maxlength="16" >
      <input name="sjjmje2" type="hidden" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ѣ���ǰ</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����ѣ��ۺ�</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>˰��</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>�����շѣ��ۺ�</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("6"))//6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����] �����Զ����㣬��¼����
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ���ǰ</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ֱ�ӷѣ��ۺ�</td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����Ѱٷֱ�</td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16">
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ѣ���ǰ</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>����ѣ��ۺ�</td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" >
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>˰��</td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" onChange="calValue(insertform)">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>�����շѣ���ǰ</td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
      <td align="right"><font color="#FF0033">*</font>�����շѣ��ۺ�</td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">�����շ���Ŀ</td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("4"))//4�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�Ƿ����Ż�</font></td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh,true);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#0000FF">�Ż�����</font></td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�������ۿ�</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("7"))//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200"  >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">��ͬ�ۿ�</font></td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�������ۿ�</font></td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>" readonly>
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16"  onChange="calValue(insertform)"></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%"> 
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[����ֱ�ӷѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
	{
		%> 
    <tr bgcolor="#E8E8FF">
      <td align="right"><font color="#0000FF">ǩԼ�ܶ��ǰ</font></td>
      <td><input name="zqqyze" type="text" value="<%=zqqyze%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#0000FF">ǩԼ�ܶ�ۺ�</font></td>
      <td><input name="zhqyze" type="text" value="<%=zhqyze%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=yhyy%>" size="76" maxlength="200">      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>��ͬ�ۿ�</td>
      <td><input type="text" name="zkl" size="8" maxlength="8" value="<%=zkl%>" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
      <td align="right"><font color="#FF0033">*</font>�������ۿ�</td>
      <td><input type="text" name="zjxzkl" size="8" maxlength="8" value="<%=zjxzkl%>">
        <b><font color="#0000FF">��>0��<=10��</font></b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ���ǰ</font></td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���̼����</td>
      <td width="31%"><input type="text" name="cdzwjmje" value="<%=cdzwjmje%>" size="20" maxlength="16" onChange="calValue(insertform)" ></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ֱ�ӷѣ��ۺ�</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="16" readonly >      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����Ѱٷֱ�</font></td>
    <td width="31%"><input type="text" name="glfbfb" value="<%=glfbfb%>" size="8" maxlength="16" readonly>
      %    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ���ǰ</font></td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="<%=zqguanlif%>" size="20" maxlength="16" readonly>      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ѣ��ۺ�</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="<%=guanlif%>" size="20" maxlength="16" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��ٷֱ�</font></td>
      <td width="34%"><input type="text" name="suijinbfb" value="<%=suijinbfb%>" size="8" maxlength="16" readonly>
% </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="<%=suijin%>" size="20" maxlength="16" readonly >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font>����Ѽ����</td>
      <td><input name="glfjmje" type="text"  onChange="calValue(insertform)" value="<%=glfjmje%>" size="20" maxlength="16" ></td>
      <td align="right"><font color="#FF0033">*</font>˰������</td>
      <td><input name="sjjmje" type="text"  onChange="calValue(insertform)" value="<%=sjjmje%>" size="20" maxlength="16" ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ���ǰ</font></td>
      <td><input type="text" name="zqwjrqyexm" value="<%=zqwjrqyexm%>" size="20" maxlength="16" readonly ></td>
      <td align="right"><font color="#FF0033">*</font><font color="#0000FF">�����շѣ��ۺ�</font></td>
      <td><input type="text" name="zhwjrqyexm" value="<%=zhwjrqyexm%>" size="20" maxlength="16" readonly ></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">�����շ���Ŀ</font></td>
      <td colspan="3"><input type="text" name="wjrqyexmsm" value="<%=wjrqyexmsm%>" size="76" maxlength="100" readonly ></td>
    </tr>
    <%
	}
	else{
		out.println("�����õ��ӱ��ۼ�须����"+dzbjjc);
		return;
	}
%> 
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��Ʒ�</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="<%=sjf%>" size="20" maxlength="16"  onKeyUp="keyGo(glf)">      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�����</td>
      <td width="31%"> 
        <input type="text" name="glf" value="<%=glf%>" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">          </td>
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
      <td width="16%" align="right"><font color="#CC0000">*</font>��װ��־</td>
      <td width="34%" height="14"><%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%> </td>
      <td width="19%" rowspan="5" align="right"> 
        <font color="#FF0033">*</font>��Ϣ��Դ      </td>
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
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz);
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
      <td width="16%" align="right">ˮ�ʷ������Ƿ񷢷�</td>
      <td width="34%"><%
	cf.radioToken(out, "sffk","Y+����&N+δ����",sffk);
%></td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
      <td width="31%"><select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onkeyup="keyGo(khxm)">
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
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ǽǿ���</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="<%=djkh%>" size="20" maxlength="20" >      </td>
      <td width="19%" align="right">��������</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="<%=fkrq%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">      </td>
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
          <input type="button"  value="���ӱ��۴�ӡԤ��" onClick="f_ck(insertform)" name="ck" >
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
	if (dzbjjc.equals("1"))//1���˹�¼��[�ۿ��ʡ����̷ѣ���ǰ]������[�ۿ��ʡ����̷ѣ���ǰ]�Զ�����[ǩԼ��]
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
	else if (dzbjjc.equals("2"))//2���˹�¼��[ǩԼ����̷ѣ���ǰ]������[ǩԼ����̷ѣ���ǰ]�Զ�����[�ۿ���]
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
	else if (dzbjjc.equals("3"))//3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ����̷ѣ���ǰ]�����Զ�����
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
	else if (dzbjjc.equals("6"))//6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����] �����Զ����㣬��¼����
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
	else if (dzbjjc.equals("4"))//4�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸ�
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
	else if (dzbjjc.equals("7"))//7�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]�����ɸģ����޸������Ż�
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
	else if (dzbjjc.equals("5"))//5�����������ӱ��ۣ�[���̷ѣ���ǰ]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]
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
	calValue(FormName);

/*
	if(	javaTrim(FormName.smhtbh)=="") {
		alert("������[�����ͬ���]��");
		FormName.smhtbh.focus();
		return false;
	}
*/
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("��ѡ��[���ۼ���]��");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("������[���ۼ���]��");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("������[�ֻ�]��[�����绰]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "�ֻ�"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "�����绰"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}


<%
	if (ssfgs.equals("FBJ00"))
	{
		%>

		/*
		if(	javaTrim(FormName.sfzhm)=="") {
			alert("������[���֤����]��");
			FormName.sfzhm.focus();
			return false;
		}
		if(!(isSfzhm(FormName.sfzhm, "���֤����"))) {
			return false;
		}
		if(	!radioChecked(FormName.sffk)) {
			alert("��ѡ��[ˮ�ʷ������Ƿ񷢷�]��");
			FormName.sffk[0].focus();
			return false;
		}
*/
		if (FormName.sffk[0].checked)
		{
			if(	javaTrim(FormName.djkh)=="") {
				alert("������[�Ǽǿ���]��");
				FormName.djkh.focus();
				return false;
			}
			if(	javaTrim(FormName.fkrq)=="") {
				alert("������[��������]��");
				FormName.fkrq.focus();
				return false;
			}
			if(!(isDatetime(FormName.fkrq, "��������"))) {
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


	if(	javaTrim(FormName.ysbm)=="") {
		alert("������[��ɫ]��");
		FormName.ysbm.focus();
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

	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}

	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("������[�Ż�����]��");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhyy)!="") {
			alert("��ѡ�������Ż�,��ɾ��[�Ż�����]��");
			FormName.yhyy.select();
			return false;
		}
	}

	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ֱ�ӷѣ���ǰ]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ֱ�ӷѣ���ǰ"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[����ֱ�ӷѣ���ǰ]����Ϊ0��");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[����ֱ�ӷѣ���ǰ]����С��[����ֱ�ӷѣ��ۺ�]��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ֱ�ӷѣ��ۺ�]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ֱ�ӷѣ��ۺ�"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[����ֱ�ӷѣ��ۺ�]����Ϊ0��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[��ͬ�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "��ͬ�ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[��ͬ�ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}
	if(	javaTrim(FormName.zjxzkl)=="") {
		alert("������[�������ۿ���]��");
		FormName.zjxzkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxzkl, "�������ۿ���"))) {
		return false;
	}
	if (FormName.zjxzkl.value<0 || FormName.zjxzkl.value>10)
	{
		alert("����[�������ۿ���]Ӧ����0��10֮�䣡");
		FormName.zjxzkl.select();
		return false;
	}


	if(	javaTrim(FormName.cdzwjmje)=="") {
		alert("������[���̼����]��");
		FormName.cdzwjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.cdzwjmje, "���̼����"))) {
		return false;
	}

/*	
	if (FormName.cdzwjmje.value<0 || FormName.cdzwjmje.value>100)
	{
		alert("����[���̼����]Ӧ����0��100֮�䣡");
		FormName.cdzwjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.glfjmje)=="") {
		alert("������[����Ѽ����]��");
		FormName.glfjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.glfjmje, "����Ѽ����"))) {
		return false;
	}

/*	
	if (FormName.glfjmje.value<0 || FormName.glfjmje.value>100)
	{
		alert("����[����Ѽ����]Ӧ����0��100֮�䣡");
		FormName.glfjmje.select();
		return false;
	}
*/
	if(	javaTrim(FormName.sjjmje)=="") {
		alert("������[˰������]��");
		FormName.sjjmje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjjmje, "˰������"))) {
		return false;
	}

/*	
	if (FormName.sjjmje.value<0 || FormName.sjjmje.value>100)
	{
		alert("����[˰������]Ӧ����0��100֮�䣡");
		FormName.sjjmje.select();
		return false;
	}
*/

	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("������[˰��ٷֱ�]��");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "˰��ٷֱ�"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("����[˰��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[˰��]��");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}

	if(	javaTrim(FormName.glfbfb)=="") {
		alert("������[����Ѱٷֱ�]��");
		FormName.glfbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.glfbfb, "����Ѱٷֱ�"))) {
		return false;
	}
	if (FormName.glfbfb.value<0 || FormName.glfbfb.value>100)
	{
		alert("����[����Ѱٷֱ�]Ӧ����0��100֮�䣡");
		FormName.glfbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("������[��ǰ�����]��");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "��ǰ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("������[�ۺ�����]��");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "�ۺ�����"))) {
		return false;
	}

	if(	javaTrim(FormName.zqwjrqyexm)=="") {
		alert("������[��ǰ�����շѣ���ǰ]��");
		FormName.zqwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zqwjrqyexm, "��ǰ�����շѣ���ǰ"))) {
		return false;
	}
	if(	javaTrim(FormName.zhwjrqyexm)=="") {
		alert("������[�ۺ������շѣ���ǰ]��");
		FormName.zhwjrqyexm.select();
		return false;
	}
	if(!(isFloat(FormName.zhwjrqyexm, "�ۺ������շѣ���ǰ"))) {
		return false;
	}

	if (FormName.zqwjrqyexm.value!=0)
	{
		if(	javaTrim(FormName.wjrqyexmsm)=="") {
			alert("������[�����շ���Ŀ]��");
			FormName.wjrqyexmsm.select();
			return false;
		}
	}


	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
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
		if(	javaTrim(FormName.cgdz)=="") {
			alert("������[�ص�װ�޵�ַ]��");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgd)=="") {
			alert("������[�ص����ضӳ�]��");
			FormName.hdsgd.focus();
			return false;
		}
		if(	javaTrim(FormName.hdsgbz)=="") {
			alert("������[�ص����ذ೤]��");
			FormName.hdsgbz.focus();
			return false;
		}
	}

	if(!(isDatetime(FormName.yxsjs, "��Ա��Чʱ��ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "��Ա��Чʱ��ֹ"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}

	if ( <%=sssjf%> < FormName.sjf.value/100.0*<%=(sjjryjbfb-0.5)%> )
	{
		alert("����Ʒѡ�¼�����ʵ����Ʒѡ�<%=sssjf%>��δ�ﵽ��˾ʵ�ձ�׼��<%=sjjryjbfb%>��%�涨");
		FormName.sjf.select();
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

function f_ck(FormName)//����FormName:Form������
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


