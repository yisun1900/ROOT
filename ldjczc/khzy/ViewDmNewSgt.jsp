<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%

	String ls_sql=null;
	String wheresql="";
	
	String fgsbh=request.getParameter("fgsbh");
	String dwbh=request.getParameter("dwbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");




	ls_sql="SELECT crm_zxkhxx.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,sjs,ywy,ysy,khjl,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��'),scsmsj,smcs,zjsmsj,zxhfsj,qdsj,crm_zxkhxx.sbsj,DECODE(ysshbz,'N','δ���','Y','ͨ��','M','���δͨ��'),zjzbjsj,dzbjze,bjjbmc,qsjhtsj,sjhtje,lfdj,jlfdjsj,cxhdbm,hddj,jhddjsj,sjf,jsjfsj,lfsj,ctsj,cxgtsj,csgtsj,DECODE(crm_zxkhxx.jzbz,'1','��װ','2','��װ'),b.dwmc as zxdm,sbyymc,lrsj,a.dwmc zxdjbm,fwlxmc,xxlysm";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b,dm_sbyybm,bdm_bjjbbm ";
	ls_sql+=" where crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+) and crm_zxkhxx.sbyybm=dm_sbyybm.sbyybm(+)";
	ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=" and crm_zxkhxx.bjjb=bdm_bjjbbm.bjjbbm(+)";

	ls_sql+=" and crm_zxkhxx.ssfgs='"+fgsbh+"'";
	ls_sql+=" and crm_zxkhxx.zxdm='"+dwbh+"'";
	ls_sql+=" and crm_zxkhxx.lrsj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and crm_zxkhxx.lrsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and crm_zxkhxx.yzxxbz='Y'";//Y����Ч��Ϣ��N����Ч��Ϣ
	ls_sql+=" and crm_zxkhxx.zxzt!='6'";//6��ɢ��

	ls_sql+=" and crm_zxkhxx.csgtbz='Y'";


	ls_sql+=" order by crm_zxkhxx.lrsj";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(2000);


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
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
	<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >

<CENTER >
  <B><font size="3">�¿ͻ�����ʩ��ͼ��</font></B>
</CENTER>


<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">�ͻ����</td>
	<td  width="2%">����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">ҵ��Ա</td>
	<td  width="2%">Ԥ��Ա</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="3%">��ѯ״̬</td>

	<td  width="2%">�״�����ʱ��</td>
	<td  width="1%">���Ŵ���</td>
	<td  width="2%">�������ʱ��</td>
	<td  width="2%">���»ط�ʱ��</td>
	<td  width="2%">ǩ��ʱ��</td>
	<td  width="2%">�ɵ�ʱ��</td>


	<td  width="2%">Ԥ�����</td>
	<td  width="2%">������ʱ��</td>
	<td  width="3%">���ӱ����ܶ�</td>
	<td  width="2%">���ۼ���</td>
	<td  width="2%">ǩ��ƺ�ͬʱ��</td>
	<td  width="3%">��ƺ�ͬ���</td>
	<td  width="2%">��������</td>
	<td  width="2%">����������ʱ��</td>
	<td  width="4%">�μӴ����</td>
	<td  width="2%">�����</td>
	<td  width="2%">�������ʱ��</td>
	<td  width="3%">ʵ����Ʒ�</td>
	<td  width="3%">����Ʒ�ʱ��</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">��ƽ��ͼʱ��</td>
	<td  width="3%">��Ч��ͼʱ��</td>
	<td  width="3%">��ʩ��ͼʱ��</td>
	<td  width="2%">��װ��־</td>
	<td  width="4%">��ѯ����</td>
	<td  width="5%">ʧ��ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">��ѯ�Ǽǲ���</td>
	<td  width="3%">��������</td>
	<td  width="34%">��Ϣ��Դ˵��</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>