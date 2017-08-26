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
String ssdw=null;

String sjsdh=null;
String zjdh=null;
String dzdh=null;
String bzdh=null;

int tssl=0;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select ysgcjdmc,sjwjrq,sgbz,khxm,sfke,hth,fwdz,lxfs,hflxbm,kgrq,sjkgrq,jgrq,sgd,sjs,zjxm,qye,zkl,yhyy,khlxmc,sjjgrq,b.dwmc dwmc,crm_khxx.dwbh dwbh,crm_khxx.bz";
	ls_sql+=" from  crm_khxx,sq_dwxx b,dm_khlxbm,dm_gcjdbm";
	ls_sql+=" where crm_khxx.dwbh=b.dwbh(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)  and khbh='"+khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
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

	//������λ
	ls_sql="select ssdw";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssdw=rs.getString(1);
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
	ls_sql+=" from sq_yhxx,sq_dwxx";
	ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and  sq_dwxx.ssfgs='"+ssdw+"' and yhmc ='"+zjxm+"' and zwbm='05'";
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
	ls_sql+=" from  crm_sjhfjl";
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
<div align="center">����طÿͻ����طü�¼�ţ�<%=hfjlh%>�� </div>
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
	<P>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="7%">�ط�ʱ��</td>
		<td  width="7%">�ط���</td>
		<td  width="8%">�طò���</td>
		<td  width="7%">�طý��</td>
		<td  width="31%">����ط�˵��</td>
		<td  width="10%">��������</td>
		<td  width="30%">��ز��Ŵ������</td>
	</tr>
	<%
	ls_sql="SELECT hfsj,hfr,a.dwmc hfbm,jglxmc, hfsm,b.dwmc dwmc,xwtclqk";
	ls_sql+=" FROM crm_sjhfjl,dm_jglxbm,crm_sjhffkbm,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where crm_sjhfjl.jglxbm=dm_jglxbm.jglxbm and khbh='"+khbh+"'  ";
	ls_sql+=" and crm_sjhfjl.hfjlh=crm_sjhffkbm.hfjlh(+) and crm_sjhfjl.hfbm=a.dwbh(+) and crm_sjhffkbm.dwbh=b.dwbh(+)";
	ls_sql+=" order by hfsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.alignStr[4]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("hfsj","1");//�в����������Hash��
	spanColHash.put("hfr","1");//�в����������Hash��
	spanColHash.put("hfbm","1");//�в����������Hash��
	spanColHash.put("jglxmc","1");//�в����������Hash��
	spanColHash.put("hfsm","1");//�в����������Hash��
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
          <tr bgcolor="#E8E8FF"> 
            <td width="14%" align="right"><font color="#CC0000">*</font>�ط�˵��</td>
            <td colspan="3"><textarea name="hfsm" rows="5" cols="87"></textarea></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="14%" align="right">��ע</td>
            <td colspan="3"> 
              <input type="text" name="bz" maxlength="100" size="89">            </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="14%" align="right" bgcolor="#E8E8FF"><font color="#CC0000">*</font>����ʽ</td>
            <td width="36%" bgcolor="#E8E8FF"> 
              <select name="clfs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f2(insertform)">
                <option value=""></option>
                <option value="0">���账��</option>
                <option value="1">������ز���</option>
              </select></td>
            <td width="14%" rowspan="5" align="right" bgcolor="#E8E8FF">��������</td>
            <td width="36%" rowspan="5" bgcolor="#E8E8FF"> 
              <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" size="9" multiple>
                <option value=""></option>
                <%
	String sql="select dwbh,dwmc from sq_dwxx  where dwlx in('F1','F2') and cxbz='N' and ssdw='"+ssdw+"' ";
	sql+=" union ";
	sql+=" select dwbh,dwmc from sq_dwxx  where dwlx in('A1') order by dwbh";
	cf.selectItem(out,sql,"");
%> 
              </select>            </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right"><font color="#CC0000">*</font>�طý��</td>
            <td bgcolor="#FFFFFF"><select name="jglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
              <option value=""></option>
              <%
	cf.selectItem(out,"select jglxbm,jglxmc from dm_jglxbm order by jglxbm","");
%>
            </select></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�ط���</font></td>
            <td width="36%" bgcolor="#FFFFFF"><input type="text" name="hfr" value="<%=yhmc%>" size="20" maxlength="20" readonly></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�ط�ʱ��</font></td>
            <td width="36%" bgcolor="#FFFFFF"><input type="text" name="hfsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="14%" align="right"><font color="#CC0000">*</font><font color="#0000CC">�طò���</font></td>
            <td width="36%"><select name="hfbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+hfbm+"'","");
%>
              </select></td>
          </tr>
          <tr> 
            <td colspan="4" align="center"> 
              <input type="hidden" name="hfjlh" value="<%=hfjlh%>" >
              <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" >
              <input type="button"  value="����" onClick="f_do(insertform)" name="button">
<input type="reset"  value="����" name="reset">            </td>
          </tr>
        </table>
      </form>
	</td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

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

	if(	javaTrim(FormName.hfsm)=="") {
		alert("��ѡ��[�ط�˵��]��");
		FormName.hfsm.focus();
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

