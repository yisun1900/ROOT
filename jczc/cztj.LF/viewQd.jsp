<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"050103")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String kkbbz=(String)session.getAttribute("kkbbz");

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

String sjfw=null;
String sjfw2=null;

sjfw=request.getParameter("sjfw");
sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String cxhdbm=request.getParameter("cxhdbm");
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	
	String myxssl="30";
	


	if (ckjgbz.equals("Y"))
	{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.smhtbh,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','δ����','2','����'),crm_khxx.yqts,zkl,crm_khxx.ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.pdsj,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,crm_khxx.sjjgrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zqguanlif,crm_khxx.guanlif,crm_khxx.suijinbfb||'%' suijinbfb,crm_khxx.suijin,crm_khxx.wdzgce+crm_khxx.zqguanlif+crm_khxx.suijin as zqqyzj,crm_khxx.qye+crm_khxx.guanlif+crm_khxx.suijin as zhqyzj,crm_khxx.sjf,crm_khxx.zjxje,crm_khxx.zhzjxje,crm_khxx.zqzjxguanlif,crm_khxx.zjxguanlif,crm_khxx.zjxsuijin,crm_khxx.zjxje+crm_khxx.zqzjxguanlif+crm_khxx.zjxsuijin as zqzjxzj,crm_khxx.zhzjxje+crm_khxx.zjxguanlif+crm_khxx.zjxsuijin as zhzjxzj,crm_khxx.sgebfb||'%',crm_khxx.sge,crm_khxx.clf,DECODE(crm_khxx.sffj,'Y','��','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��','N','��'),b.dwmc rzsc,khlxmc";
	}
	else{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.smhtbh,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','δ����','2','����'),crm_khxx.yqts,zkl,crm_khxx.ywy,a.dwmc qydm,crm_khxx.qyrq,crm_khxx.pdsj,crm_khxx.kgrq,crm_khxx.sjkgrq,crm_khxx.jgrq,crm_khxx.sjjgrq,'' wdzgce,'' qye,'' zqguanlif,'' guanlif,'' suijinbfb,'' suijin,'' zqqyzj,'' zhqyzj,'' sjf,'' zjxje,'' zhzjxje,'' zqzjxguanlif,'' zjxguanlif,'' zjxsuijin,'' zqzjxzj,'' zhzjxzj,'' sgebfb,'' sge,'' clf,DECODE(crm_khxx.sffj,'Y','��','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��','N','��'),b.dwmc rzsc,khlxmc";
	}
	ls_sql+=" FROM crm_khxx,crm_zxkhxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d,dm_khlxbm,jc_cxhd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
 	ls_sql+=" and crm_khxx.khbh=crm_zxkhxx.khbh ";
	ls_sql+=" and jc_cxhd.cxhdbm='"+cxhdbm+"' ";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and (crm_zxkhxx.cxhdbm=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmxq=jc_cxhd.cxhdmc or crm_zxkhxx.cxhdbmzh=jc_cxhd.cxhdmc)";
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	
		{
			ls_sql+=" and  (crm_zxkhxx.fgsbh='"+fgs+"')";
			//wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
		}
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))
		{
			ls_sql+=" and  crm_zxkhxx.zxdm='"+dwbh+"'";
			//wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
		}
	}
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("viewQd.jsp","","","");
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_xb","crm_khxx_fwdz","crm_khxx_lxfs","crm_khxx_hth","crm_khxx_sjs","crm_khxx_qye","crm_khxx_jcjjqye","crm_khxx_qyrq","crm_khxx_jsje","crm_khxx_gcjdbm","sq_dwxx_dwmc","crm_khxx_sgd","crm_khxx_zjxm"};
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
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.alignStr[8]="align='left'";
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
  <B><font size="3">ǩ����ѯ-���ټ����������˵����Ǽ�װ�ͻ���</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(540,2,2);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">�ͻ����</td>
	<td  width="150px">�ͻ�����</td>
	<td  width="130px">��ͬ��</td>
	<td  width="100px">�����ͬ���</td>
	<td  width="70px">����֤</td>
	<td  width="70px">�ͻ�����</td>
	<td  width="90px">���̽���</td>
	<td  width="70px">��װ��־ </td>
	<td  width="310px">���ݵ�ַ</td>
	<td  width="90px">���ʦ</td>
	<td  width="140px">ʩ����</td>
	<td  width="90px">�ʼ�</td>
	<td  width="280px">�μӴ����</td>
	<td  width="70px">ͣ��</td>
	<td  width="200px">���ι�������</td>
	<td  width="90px">��������</td>
	<td  width="70px">�Ƿ�����</td>
	<td  width="70px">����������</td>
	<td  width="70px">�ۿ���</td>
	<td  width="70px">ҵ��Ա</td>
	<td  width="150px">ǩԼ����</td>
	<td  width="90px">ǩԼ����</td>
	<td  width="90px">�ɵ�ʱ��</td>
	<td  width="90px">��ͬ��������</td>
	<td  width="90px">ʵ�ʿ�������</td>
	<td  width="90px">��ͬ��������</td>
	<td  width="90px">ʵ�ʿ�������</td>
	<td  width="120px">����ԭ����</td>
	<td  width="120px">����ǩԼ��</td>
	<td  width="120px">��ǰ�����</td>
	<td  width="120px">�ۺ�����</td>
	<td  width="60px">˰��ٷֱ�</td>
	<td  width="120px">˰��</td>
	<td  width="120px">ǩԼ��+�����+˰��(��ǰ)</td>
	<td  width="120px">ǩԼ��+�����+˰��(�ۺ�)</td>
	<td  width="120px">��Ʒ�</td>
	<td  width="90px">��ǰ������</td>
	<td  width="90px">�ۺ�������</td>
	<td  width="90px">��ǰ����������</td>
	<td  width="90px">�ۺ�����������</td>
	<td  width="90px">������˰��</td>
	<td  width="120px">������+����������+������˰��(��ǰ)</td>
	<td  width="120px">������+����������+������˰��(�ۺ�)</td>
	<td  width="90px">ʩ����ٷֱ�</td>
	<td  width="90px">ʩ����</td>
	<td  width="90px">���Ϸ�</td>
	<td  width="70px">�Ƿ񷵾�</td>
	<td  width="90px">�����ܽ��</td>
	<td  width="70px">��˾�е������</td>
	<td  width="70px">�Ƿ�����֤</td>
	<td  width="150px">��֤�г�</td>
	<td  width="120px">��ϵ�ͻ�</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
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