<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>



<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='050118'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[�ͻ������ѯ]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
%>

<%
String ckjgbz=(String)session.getAttribute("ckjgbz");
String kkbbz=(String)session.getAttribute("kkbbz");


int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";

	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_khxx.bxjzsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";
	}
	sjfw=request.getParameter("sjfw2");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_khxx.bxjzsj<=TO_DATE('"+sjfw+"  23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	String myxssl=null;
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		String xsfg=request.getParameter("xsfg");
		if (xsfg.equals("2"))
		{
			pageObj.setType("EXCEL",response);
		}

		myxssl=request.getParameter("myxssl");
	}



	if (ckjgbz.equals("Y"))
	{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','δ����','2','����'),crm_khxx.yqts,DECODE(czkbz,'0','','1','<font color=\"#FF0000\">δ���</font>','2','<font color=\"#00FF00\">�����</font>'),zkl,ywy,a.dwmc qydm,sjjgrq,crm_khxx.bxkssj,crm_khxx.bxjzsj,crm_khxx.wdzgce,crm_khxx.qye,DECODE(crm_khxx.sffj,'Y','��','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��','N','��'),b.dwmc rzsc,khlxmc";
	}
	else{
		ls_sql="SELECT crm_khxx.khbh,crm_khxx.khxm,crm_khxx.hth,crm_khxx.lxfs,DECODE(kgzbz,'Y','�ѳ�','N','<font color=\"#FF00FF\">δ��</font>'),DECODE(zt,'2','��װ','4','����','5','���','3','<font color=\"#FF00FF\">���˵�</font>'),ysgcjdmc,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),crm_khxx.fwdz,crm_khxx.sjs,sgdmc||'('||DECODE(sq_sgd.sgdlx,'S0','��ֱ��','S1','ֱ��') sgd,crm_khxx.zjxm,crm_khxx.cxhdbm,DECODE(NVL(tgbz,'W'),'W','����','N','<font color=\"#00FF00\">����</font>','Y','<font color=\"#FF0000\">��ͣ��</font>'),c.gcyszxmmc ybysxmbm,d.gcyszxmmc zqysxmbm,DECODE(crm_khxx.gcsfyq,'1','δ����','2','����'),crm_khxx.yqts,DECODE(czkbz,'0','','1','<font color=\"#FF0000\">δ���</font>','2','<font color=\"#00FF00\">�����</font>'),zkl,ywy,a.dwmc qydm,sjjgrq,crm_khxx.bxkssj,crm_khxx.bxjzsj,0,0,DECODE(crm_khxx.sffj,'Y','��','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��','N','��'),b.dwmc rzsc,khlxmc";
	}
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd,dm_gcjdbm,dm_gcyszxmbm c,dm_gcyszxmbm d,dm_khlxbm";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";
    ls_sql+=" and crm_khxx.ybysxmbm=c.gcyszxmbm(+) and crm_khxx.zqysxmbm=d.gcyszxmbm(+) and crm_khxx.khlxbm=dm_khlxbm.khlxbm(+)";
	ls_sql+=" and crm_khxx.kbxbz='Y' ";
    ls_sql+=wheresql;
	ls_sql+=" order by crm_khxx.bxjzsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxTypeBxList.jsp","SelectTypeCrm_khxx.jsp","","");
	if (kkbbz.equals("Y"))//Y���ɿ�����N�����ɿ���
	{
		pageObj.setPageRow(Integer.parseInt(myxssl));
	}
	else{
		pageObj.setPageRow(25);
	}


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
  <B><font size="3">���޿ͻ����ۺ�</font></B>
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="3%">��ͬ��</td>
	<td  width="6%">��ϵ��ʽ</td>
	<td  width="2%">����֤</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">���̽���</td>
	<td  width="2%">��װ��־ </td>
	<td  width="8%">���ݵ�ַ</td>
	<td  width="3%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="2%">���̵���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">ͣ��</td>
	<td  width="3%">���ι�������</td>
	<td  width="3%">��������</td>
	<td  width="2%">�Ƿ�����</td>
	<td  width="2%">����������</td>
	<td  width="2%">���ۿ����</td>
	<td  width="2%">�ۿ���</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="5%">ǩԼ����</td>
	<td  width="3%">ʵ�ʿ�������</td>
	<td  width="3%">���޿�ʼʱ��</td>
	<td  width="3%">���޽�ֹʱ��</td>
	<td  width="4%">����ԭ����</td>
	<td  width="4%">����ǩԼ��</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="3%">�����ܽ��</td>
	<td  width="2%">��˾�е������</td>
	<td  width="2%">�Ƿ�����֤</td>
	<td  width="4%">��֤�г�</td>
	<td  width="3%">��ϵ�ͻ�</td>
</tr>
<%
	pageObj.displayDateSum();
	pageObj.displayFoot();
%> 

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

//-->
</script>
</html>