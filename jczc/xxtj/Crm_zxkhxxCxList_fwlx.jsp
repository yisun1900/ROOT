<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String kkbbz=(String)session.getAttribute("kkbbz");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String zxdm=null;
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+ssfgs+"')";

	zxdm=request.getParameter("zxdm");
	if (!(zxdm.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+zxdm+"')";

	
	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	String sjfw2=null;
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		sjfw2=sjfw2.trim();
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') as crm_zxkhxx_zxzt,DECODE(shbz,'N','δ���','Y','���'),DECODE(sfzdzbj,'N','δ��','Y','����') sfzdzbj,dzbjze,crm_zxkhxx.zcbjje,bjjbmc,DECODE(lfdjbz,'N','δ��','Y','�ѽ�','T','�˶���') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','δ��','Y','�ѽ�','T','�˶���') hddjbz,hddj,jhddjsj,DECODE(sjfbz,'N','δ��','Y','�ѽ�','T','����Ʒ�') sjfbz,sjf,jsjfsj,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,b.dwmc as zxdm,sjs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.hfrq as crm_zxkhxx_hfrq,DECODE(crm_zxkhxx.hdbz,'1','�ǻص�','2','���ʦ�ص�','3','ʩ���ӻص�','4','�Ͽͻ��ص�','5','Ա���ص�') as crm_zxkhxx_hdbz,crm_zxkhxx.bz  ";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";
	ls_sql+=wheresql;

	ls_sql+=" and crm_zxkhxx.fwlxbm is null";	
	ls_sql+=" order by crm_zxkhxx.lrsj";	

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxCxList_fj.jsp","","","");
	pageObj.setPageRow(40);

/*
//������ʾ��
	String[] disColName={"khbh","crm_zxkhxx_khxm","crm_zxkhxx_xb","crm_zxkhxx_fwdz","crm_zxkhxx_lxfs","crm_zxkhxx_fwlxbm","crm_zxkhxx_sfxhf","crm_zxkhxx_hfrq","crm_zxkhxx_hflxbm","crm_zxkhxx_hdbz","crm_zxkhxx_zxzt","crm_zxkhxx_khlxbm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<%
if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
	<%
}
else{
	%>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
	<noscript><iframe scr="*.htm"></iframe></noscript>
	<%
}
%>

<CENTER >
  <B><font size="3">�������Ϳ�ȱ</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="3%">����</td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">��ѯ״̬</td>
	<td  width="2%">��˱�־</td>
	<td  width="2%">���ӱ���</td>
	<td  width="3%">���ӱ����ܶ�</td>
	<td  width="3%">���ı���</td>
	<td  width="3%">���ۼ���</td>
	<td  width="2%">���������־</td>
	<td  width="3%">��������</td>
	<td  width="3%">����������ʱ��</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">������־</td>
	<td  width="3%">�����</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="2%">��Ʒѱ�־</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">����Ʒ�ʱ��</td>
	<td  width="2%">��װ��־</td>
	<td  width="6%">��ϵ��ʽ</td>
	<td  width="5%">��ѯ����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ҵ��Ա</td>
	<td  width="4%">ʧ��ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">��ѯ�Ǽǲ���</td>
	<td  width="3%">��������</td>
	<td  width="3%">�ط�����</td>
	<td  width="2%">�ص���־</td>
	<td  width="6%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">

function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //���� Ctrl+n
		event.returnValue=false;
		alert('��ֹ����') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //���� Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //���� shift+F10
		event.returnValue=false;
	}
}

<%
	pageObj.printScript();
%> 

//-->
</script>
</html>