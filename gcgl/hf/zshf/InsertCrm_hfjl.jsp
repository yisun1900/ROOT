<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();

String dqbm=(String)session.getAttribute("dqbm");
String yhjs=(String)session.getAttribute("yhjs");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");
String hfbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String khxm=null;
String hth=null;
String fwdz=null;
String lxfs=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sgbz=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String zjxm=null;
String bz=null;

String hflxbm=null;
String ysgcjdmc=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
String hfjlh=null;
String qye=null;
String zkl=null;
String yhyy=null;
String khlxmc=null;
String dwbh=null;
String dwmc=null;
String sjjgrq=null;
String sjwjrq=null;
double sfke=0;
int hfsl=0;
int cpsl=0;
String ssfgs=null;

String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

int tssl=0;

String ybysxmbm=null;
String zqysxmbm=null;
String sybgcrq=null;
String szqsj=null;

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select fgsbh,ysgcjdmc,sjwjrq,sgbz,khxm,sfke,hth,fwdz,lxfs,hflxbm,kgrq,sjkgrq,jgrq,sgd,sjs,zjxm,qye,zkl,yhyy,khlxmc,sjjgrq,b.dwmc dwmc,crm_khxx.dwbh dwbh,crm_khxx.bz";
	ls_sql+=" ,crm_khxx.ybysxmbm,crm_khxx.zqysxmbm,crm_khxx.sybgcrq,crm_khxx.szqsj";
	ls_sql+=" from  crm_khxx,sq_dwxx b,dm_khlxbm,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=b.dwbh(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)  and khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ybysxmbm=cf.fillNull(rs.getString("ybysxmbm"));
		zqysxmbm=cf.fillNull(rs.getString("zqysxmbm"));
		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		ssfgs=rs.getString("fgsbh");
		sfke=rs.getDouble("sfke");
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=cf.fillHtml(rs.getString("khxm"));
		hth=cf.fillHtml(rs.getString("hth"));
		fwdz=cf.fillHtml(rs.getString("fwdz"));
		lxfs=cf.fillHtml(rs.getString("lxfs"));
		hflxbm=cf.fillHtml(rs.getString("hflxbm"));
		ysgcjdmc=cf.fillHtml(rs.getString("ysgcjdmc"));

		sjwjrq=cf.fillHtml(rs.getDate("sjwjrq"));
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		sjkgrq=cf.fillHtml(rs.getDate("sjkgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));

		sgd=cf.fillHtml(rs.getString("sgd"));
		sjs=cf.fillHtml(rs.getString("sjs"));
		zjxm=cf.fillHtml(rs.getString("zjxm"));
        qye=cf.fillHtml(rs.getString("qye"));
		zkl=cf.fillHtml(rs.getString("zkl"));
		yhyy=cf.fillHtml(rs.getString("yhyy"));
		khlxmc=cf.fillHtml(rs.getString("khlxmc"));
	    sjjgrq=cf.fillHtml(rs.getDate("sjjgrq"));
	    dwmc=cf.fillHtml(rs.getString("dwmc"));
	    dwbh=cf.fillHtml(rs.getString("dwbh"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();


	//���ʦ�绰
	ls_sql=" select dh from sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and yhmc ='"+sjs+"' and zwbm='04'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

	//���̵����绰
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+zjxm+"' and zwbm='05'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		zjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();


//�ӳ��绰
	ls_sql=" select sgdmc,dh from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		dzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

//�೤�绰
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();

	//�طü�¼��
	ls_sql="select NVL(max(substr(hfjlh,8,2)),0)";
	ls_sql+=" from  crm_hfjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hfsl=rs.getInt(1);
	}
	rs.close();
	
	hfjlh=khbh+cf.addZero(hfsl+1,2);

	ls_sql="select count(*)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		tssl=rs.getInt(1);
	}
	rs.close();


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">�绰�طã��طü�¼�ţ�<%=hfjlh%>�� </div>
<table width="100%" border="1" style="FONT-SIZE:12" cellpadding="1" cellspacing="0">
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>�ͻ�����</b>��</font><%=khxm%>��<%=lxfs%>��</td>
    <td colspan="2"><font color="#0000FF"><b>��ͬ��</b>��</font><%=hth%></td>
    <td width="26%"><font color="#0000CC"><b>�ͻ����</b>��</font><%=khbh%></td>
    <td width="24%"><font color="#0000FF"><b>��ϵ�ͻ�</b>��</font><%=khlxmc%></td>
  </tr>
  <tr> 
    <td colspan="4"><font color="#0000CC"><b>���ݵ�ַ</b>��</font><%=fwdz%></td>
    <td width="26%"><font color="#0000FF"><b>ǩԼ���</b>��</font><%=qye%>��<font color="#0000FF">�ۿ��ʣ�</font><%=zkl%>��</td>
    <td width="24%"><font color="#0000FF"><strong>��װʵ����</strong>��</font><%=sfke%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>���ʦ</b></font>����<%=dwmc%>��<%=sjs%>��<%=sjsdh%>��</td>
    <td colspan="2"><font color="#0000CC"><b>���̵���</b>��</font><%=zjxm%>��<%=zjdh%>��</td>
    <td width="26%"><font color="#0000CC"><b>ʩ����</b>��</font><%=sgdmc%>��<%=dzdh%>��</td>
    <td width="24%"><font color="#0000CC"><b>�೤</b>��</font><%=sgbz%>��<%=bzdh%>��</td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>Ӧ��������</b>��</font><%=kgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>Ӧ��������</b>��</font><%=jgrq%></td>
    <td colspan="2"><font color="#0000FF"><b>�Ż�����</b>��</font><%=yhyy%></td>
  </tr>
  <tr> 
    <td colspan="2"><font color="#0000CC"><b>ʵ��������</b>��</font><%=sjkgrq%></td>
    <td colspan="2"><font color="#0000CC"><b>ʵ��������</b>��</font><%=sjjgrq%></td>
    <td width="26%"><font color="#0000CC"><b>ʵ���������</b>��</font><%=sjwjrq%></td>
    <td width="24%"><font color="#0000CC"><b>���̽���</b>��</font><%=ysgcjdmc%> </td>
  </tr>
  <tr>
    <td colspan="6"><font color="#0000CC"><b>��ע</b>��</font><%=bz%></td>
  </tr>
</table>
<%
if (hfsl>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">�ط�����</td>
		<td  width="7%">�ط�ʱ��</td>
		<td  width="8%">�طò���</td>
		<td  width="7%">�طý��</td>
		<td  width="31%">�ط�����</td>
		<td  width="10%">��������</td>
		<td  width="30%">��ز��Ŵ������</td>
	</tr>
	<%
	ls_sql="SELECT hflxmc,hfsj,a.dwmc hfbm,jglxmc,DECODE(sjshfnr,null,'',sjshfnr,'[���ʦ]��'||sjshfnr)||DECODE(zjyhfnr,null,'',zjyhfnr,'��[���̵���]��'||zjyhfnr)||DECODE(sgdhfnr,null,'',sgdhfnr,'��[ʩ����]��'||sgdhfnr)||DECODE(jchfnr,null,'',jchfnr,'��[����]��'||jchfnr)||DECODE(crm_hfjl.bz,null,'',crm_hfjl.bz,'��[��ע]��'||crm_hfjl.bz) as hfnr,b.dwmc dwmc,xwtclqk";
	ls_sql+=" FROM crm_hfjl,dm_jglxbm,crm_gchffkbm,sq_dwxx a,sq_dwxx b,dm_hflxbm";
    ls_sql+=" where crm_hfjl.jglxbm=dm_jglxbm.jglxbm and khbh='"+khbh+"'  ";
	ls_sql+=" and crm_hfjl.hfjlh=crm_gchffkbm.hfjlh(+) and crm_hfjl.hfbm=a.dwbh(+) and crm_gchffkbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_hfjl.hflxbm=dm_hflxbm.hflxbm";
	ls_sql+=" order by hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hflxmc","1");//�в����������Hash��
	spanColHash.put("hfsj","1");//�в����������Hash��
	spanColHash.put("hfbm","1");//�в����������Hash��
	spanColHash.put("jglxmc","1");//�в����������Hash��
	spanColHash.put("hfnr","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>

<%
if (tssl>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCFFCC"  align="center">
		<td  width="9%">����ʱ��</td>
		<td  width="10%">����ʽ</td>
		<td  width="9%">�᰸״̬</td>
		<td  width="11%">���β��Ŵ���</td>
		<td  width="62%">Ͷ�߱�������</td>
	</tr>
	<%

	ls_sql="SELECT tsjlh,slsj,slfsmc,DECODE(crm_tsjl.clzt,'0','�ǿͷ��Ǽ�','1','�ͷ�����','2','�ڴ���','3','�᰸','9','������') clzt,DECODE(crm_tsjl.zrbmclzt,'1','δ����','2','�ڴ���','3','�ѽ��') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+khbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";

//������ʾ��
	String[] disColName={"slsj","slfsmc","clzt","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("slsj",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>

<table width="100%" border="0">
  <tr>
    <td>
<form method="post" action="SaveInsertCrm_hfjl.jsp" name="insertform" >
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          
          <tr bgcolor="#FFFFCC">
            <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">������Ŀ</font></strong></td>
            <td bgcolor="#E8E8FF"><A HREF="/khxx/Crm_gcfxysjlCxList.jsp?khbh=<%=khbh%>" target="_blank"><%cf.selectItem(out,"select gcysxmbm,gcysxmmc from dm_gcysxm where gcysxmbm='"+zqysxmbm+"'",zqysxmbm,true);%></A></td>
            <td align="right" bgcolor="#E8E8FF"><strong><font color="#0000CC">����ʱ��</font></strong></td>
            <td bgcolor="#E8E8FF"><%=szqsj%></td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="13%" align="right">���ʦ</td>
            <td width="37%">��Ʒ�����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sjfa","");
%><br>
              ���ڷ���<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","hqfw","");
%><br>
              ���������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jdqk","");
%> </td>
            <td width="14%" align="right">���ʦ�ط�����</td>
            <td width="36%"> 
              <textarea name="sjshfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="13%" align="right">���̵���</td>
            <td width="37%" bgcolor="#E8E8FF">����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyfw","");
%><br>
              ��λ��<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjydw","");
%><br>
              ����<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","zjyjz","");
%></td>
            <td width="14%" align="right">���̵����ط�����</td>
            <td width="36%"> 
              <textarea name="zjyhfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#FFFFCC"> 
            <td width="13%" align="right">ʩ����</td>
            <td width="37%">�������ʣ�<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","fwsz","");
%><br>
              ʩ��������<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","sgzl","");
%><br>
              �������ʣ�<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","grsz","");
%> </td>
            <td width="14%" align="right">ʩ���ӻط�����</td>
            <td width="36%"> 
              <textarea name="sgdhfnr" rows="3" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#E8E8FF"> 
            <td width="13%" align="right">���ɼҾ�</td>
            <td width="37%"> �Ҿ����ʦ 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcjjsjs","");
%>			  
              <br>
              �Ҿӹ��ʣ� 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jsjjgw","");
%>			  
              <br>
              ��ĿרԱ�� 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcxmzy","");
%>			  
              <br>
              �ͻ���װ�� 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jcshaz","");
%>			  
              <br>
              ��Ʒ������ 
<%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm","jccpzl","");
%>            </td>
            <td width="14%" align="right">���ɼҾӻط�����</td>
            <td width="36%">
              <textarea name="jchfnr" rows="5" cols="33"></textarea>            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">��ע</td>
            <td colspan="3"> 
              <input type="text" name="bz" maxlength="100" size="89">            </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>���λط�����</td>
            <td width="37%"> 
              <select name="hflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectItem(out,"select hflxbm,hflxmc from dm_hflxbm where hfdl='2' and hflxbm='"+hflxbm+"'",hflxbm);
%> 
              </select>
              <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
              <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
              <input type="hidden" name="hfbm" value="<%=hfbm%>" size="20" maxlength="20" >
              <input type="hidden" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" >
              <input type="hidden" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" >            </td>
            <td width="14%" align="right" bgcolor="#FFFFFF"><b><font color="#CC0000">���̽���</font></b></td>
            <td width="36%"> <%=ysgcjdmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>�طý��</td>
            <td width="37%" bgcolor="#FFFFFF"> 
              <select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <option value=""></option>
                <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm","");
%> 
              </select>            </td>
            <td rowspan="5" align="right" bgcolor="#E8E8FF">�������� </td>
            <td rowspan="5" bgcolor="#E8E8FF"> 
              <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:252PX" size="9" multiple>
                <option value=""></option>
                <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'��'||b.dwmc||'��' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right" bgcolor="#E8E8FF"><font color="#FF0000">*</font>����ʽ </td>
            <td width="37%" bgcolor="#E8E8FF"> 
              <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                <option value=""></option>
                <option value="0">���账��</option>
                <option value="1">������ز���</option>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right"><font color="#FF0000">*</font>�����´λط�ʱ��</td>
            <td width="37%" bgcolor="#FFFFFF"> 
				<input type="radio" name="sfjxhf"  value="Y" onClick="f1(insertform)">
				���� 
				<input type="radio" name="sfjxhf"  value="N" onClick="f1(insertform)">
				������ 
				<input type="radio" name="sfjxhf"  value="F" onClick="f1(insertform)">
				���»ط�			</td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">�´λط�����</td>
            <td width="37%" bgcolor="#FFFFFF"> 
              <select name="xchflxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="13%" align="right">�´λط�����</td>
            <td width="37%"> 
              <input type="text" name="xchfrq" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">            </td>
          </tr>
          <tr> 
            <td colspan="4" align="center"> 
              <input type="button"  value="����" onClick="f_do(insertform)" name="button">
              <input type="button"  value="Ͷ�ߵǼ�" onClick="window.open('/tsgl/tsdj/InsertCrm_tsjl.jsp?khbh=<%=khbh%>')" name="button">
              <input type="button"  value="���޵Ǽ�" onClick="window.open('/tsgl/bxdj/InsertCrm_tsjl.jsp?khbh=<%=khbh%>')" name="button2">
              <input type="reset"  value="����" name="reset">            </td>
          </tr>
        </table>
      </form>
	</td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//����Ajax
	cf.ajax(out);
%>

function f1(FormName)//����FormName:Form������
{
	if (FormName.sfjxhf[0].checked)//����
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		var actionStr="/gcgl/hfjl/InsertCx.jsp?ssfgs=<%=ssfgs%>";

//		window.open(actionStr);
		openAjax(actionStr);
	}
	else if (FormName.sfjxhf[1].checked)//������
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value="";
		FormName.xchflxbm.options[0].text="";

		FormName.xchfrq.value='';
	}
	else if (FormName.sfjxhf[2].checked)//���»ط�
	{
		FormName.xchflxbm.length=1;
		FormName.xchflxbm.options[0].value=FormName.hflxbm.options[0].value;
		FormName.xchflxbm.options[0].text=FormName.hflxbm.options[0].text;
	}
}

function getAjax(ajaxRetStr) 
{
	var value1=getStrValue(ajaxRetStr,1);
	strToSelect(insertform.xchflxbm,value1);
}


function f2(FormName)//����FormName:Form������
{
	if (FormName.clfs.value=='0')
	{
		notAll(FormName.dwbh);
	}
}

function f_do(FormName)//����FormName:Form������
{
	f2(FormName);

	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.hflxbm)=="") {
		alert("��ѡ��[���λط�����]��");
		FormName.hflxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.jglxbm)=="") {
		alert("��ѡ��[�طý��]��");
		FormName.jglxbm.focus();
		return false;
	}

	if(	javaTrim(FormName.clfs)=="") {
		alert("��ѡ��[����ʽ]��");
		FormName.clfs.focus();
		return false;
	}
	if (FormName.clfs.value=='1')
	{
		if (!selectChecked(FormName.dwbh)){
			alert("��ѡ��[��������]��");
			FormName.dwbh.focus();
			return false;
		}
	}

	
	if(	!radioChecked(FormName.sfjxhf)) {
		alert("��ѡ��[�����´λط�ʱ��]��");
		FormName.sfjxhf[0].focus();
		return false;
	}

	if (FormName.sfjxhf[0].checked || FormName.sfjxhf[2].checked)
	{
		if(	javaTrim(FormName.xchflxbm)=="") {
			alert("��ѡ��[�´λط�����]��");
			FormName.xchflxbm.focus();
			return false;
		}

		if(	javaTrim(FormName.xchfrq)=="") {
			alert("��ѡ��[�´λط�����]��");
			FormName.xchfrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.xchfrq, "�´λط�����"))) {
			return false;
		}
	}
	

	if(	javaTrim(FormName.hfr)=="") {
		alert("������[�ط���]��");
		FormName.hfr.focus();
		return false;
	}
	if(	javaTrim(FormName.hfsj)=="") {
		alert("������[�ط�ʱ��]��");
		FormName.hfsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.hfsj, "�ط�ʱ��"))) {
		return false;
	}



	FormName.submit();
	return true;
}
//-->
</SCRIPT>

