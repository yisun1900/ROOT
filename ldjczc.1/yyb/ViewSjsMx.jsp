<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"170201")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String kkbbz=(String)session.getAttribute("kkbbz");
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ls_sql=null;

	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String skfw=cf.GB2Uni(cf.getParameter(request,"skfw"));
	String wheresql=cf.GB2Uni(cf.getParameter(request,"wheresql"));


	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�����˻ؿͻ�','3','��ǩԼ','4','��˾ǩ��ʧ��','5','���·������'),sum(cw_khfkjl.fkje),crm_zxkhxx.fwdz,b.dwmc as zxdm,crm_zxkhxx.sjs,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" FROM crm_zxkhxx,cw_khfkjl,dm_fwlxbm,sq_dwxx b,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) ";
	ls_sql+=" and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.khbh=cw_khfkjl.khbh";
	ls_sql+=" and  crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and (NVL(crm_zxkhxx.lfdj,0)+NVL(crm_zxkhxx.hddj,0)+NVL(crm_zxkhxx.sjf,0))!=0";
	ls_sql+=" and  cw_khfkjl.scbz='N'";
	ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=wheresql;
	if (sjs.equals("?"))
	{
		ls_sql+=" and  crm_zxkhxx.sjs is null";
	}
	else{
		ls_sql+=" and  crm_zxkhxx.sjs='"+sjs+"'";
	}
	if (skfw!=null)
	{
		skfw=cf.GB2Uni(skfw);
		if (skfw.equals("1"))
		{
			ls_sql+=" and  (cw_khfkjl.fklxbm in('51','52','53'))";
		}
		else if (skfw.equals("2"))
		{
			ls_sql+=" and  (cw_khfkjl.fklxbm not in('51','52','53'))";
		}
	}
	ls_sql+=" group by crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.zxzt,crm_zxkhxx.fwdz,b.dwmc,crm_zxkhxx.sjs,ysy,khjl,ywy,dzbjze,bjjbmc,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,crm_zxkhxx.jzbz,crm_zxkhxx.lrsj,fwlxmc";
	ls_sql+=" order by b.dwmc,khxm";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);



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
<noscript><iframe scr="*.htm"></iframe></noscript>

<CENTER >
  <B><font size="3">������ϸ��<%=sjs%>��</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�ͻ����</td>
	<td  width="4%">����</td>
	<td  width="3%">��ѯ״̬</td>
	<td  width="4%">�����ܶ�</td>
	<td  width="10%">���ݵ�ַ</td>
	<td  width="4%">��ѯ����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">ҵ��Ա</td>
	<td  width="4%">���ӱ����ܶ�</td>
	<td  width="3%">���ۼ���</td>
	<td  width="4%">��װ����</td>
	<td  width="4%">����װ����ʱ��</td>
	<td  width="7%">�μӴ����</td>
	<td  width="4%">�ײ����򶩽�</td>
	<td  width="4%">���ײ����򶩽�ʱ��</td>
	<td  width="4%">ʵ����Ʒ�</td>
	<td  width="4%">����Ʒ�ʱ��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="4%">��ƽ��ͼʱ��</td>
	<td  width="4%">��Ч��ͼʱ��</td>
	<td  width="4%">��ʩ��ͼʱ��</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="3%">��������</td>
</tr>
<%
	pageObj.displayDateSum();
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