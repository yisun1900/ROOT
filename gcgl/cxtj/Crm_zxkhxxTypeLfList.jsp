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
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";

	String sjfw=null;
	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD'))";
	}
	sjfw=request.getParameter("sjfw2");
	if (sjfw!=null)
	{
		sjfw=sjfw.trim();
		if (!(sjfw.equals("")))	wheresql+="  and (crm_zxkhxx.lfsj<=TO_DATE('"+sjfw+"  23:59:59','YYYY-MM-DD hh24:mi:ss'))";
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


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.lxfs,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','�ɵ����δͨ��','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') as crm_zxkhxx_zxzt,DECODE(shbz,'N','δ���','Y','���'),DECODE(sfzdzbj,'N','δ��','Y','����') sfzdzbj,dzbjze,crm_zxkhxx.zcbjje,bjjbmc,DECODE(lfdjbz,'N','δ��','Y','�ѽ�','T','�˶���') lfdjbz,lfdj,jlfdjsj,cxhdbm,DECODE(hddjbz,'N','δ��','Y','�ѽ�','T','�˶���') hddjbz,hddj,jhddjsj,DECODE(sjfbz,'N','δ��','Y','�ѽ�','T','����Ʒ�') sjfbz,sjf,lfsj,DECODE(crm_zxkhxx.lfbz,'N','δ����','Y','������'),DECODE(crm_zxkhxx.ctbz,'N','δ��ͼ','Y','�ѳ�ͼ'),DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),b.dwmc as zxdm,sjs,ywy,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc as crm_zxkhxx_fwlxbm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and crm_zxkhxx.zxzt in('0','1','5')";
	ls_sql+=" and crm_zxkhxx.lfbz='Y'";
	ls_sql+=wheresql;
	ls_sql+=" order by crm_zxkhxx.lfsj";
//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_zxkhxxTypeLfList.jsp","SelectTypeCrm_khxx.jsp","","");
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
	coluParm.link="/dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">�����ͻ���δǩ����</font></B>
</CENTER>


<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(320);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="3%">����</td>
	<td  width="9%">���ݵ�ַ</td>
	<td  width="7%">��ϵ��ʽ</td>
	<td  width="3%">��ѯ״̬</td>
	<td  width="2%">��˱�־</td>
	<td  width="2%">���ӱ���</td>
	<td  width="3%">���ӱ����ܶ�</td>
	<td  width="3%">���ı���</td>
	<td  width="3%">���ۼ���</td>
	<td  width="2%">���������־</td>
	<td  width="3%">��������</td>
	<td  width="3%">����������ʱ��</td>
	<td  width="5%">�μӴ����</td>
	<td  width="2%">������־</td>
	<td  width="3%">�����</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="2%">��Ʒѱ�־</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">����ʱ��</td>
	<td  width="2%">������־</td>
	<td  width="2%">��ͼ��־</td>
	<td  width="2%">��װ��־</td>
	<td  width="5%">��ѯ����</td>
	<td  width="3%">���ʦ</td>
	<td  width="3%">ҵ��Ա</td>
	<td  width="6%">ʧ��ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">��ѯ�Ǽǲ���</td>
	<td  width="3%">��������</td>
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


//-->
</script>
</html>