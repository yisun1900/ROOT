<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String ssfgs=(String)session.getAttribute("ssfgs");

	String ls_sql=null;
	String wheresql="";

	String khxm=null;
	String fwdz=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm in(select dwbh from sq_dwxx where dwlx='F2' and ssdw='"+fgs+"'))";
	
	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";

	
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz+"%')";
	}


	ls_sql="SELECT crm_zxkhxx.khbh as khbh,crm_zxkhxx.khxm as crm_zxkhxx_khxm,crm_zxkhxx.fwdz as crm_zxkhxx_fwdz,crm_zxkhxx.lxfs as crm_zxkhxx_lxfs,sjs,ywy, DECODE(crm_zxkhxx.zxzt,'0','��ѯ�Ǽ�','1','���ʦ��ѯ','2','�����˻ؿͻ�','3','��ǩԼ','4','ʧ��') as crm_zxkhxx_zxzt,lrsj,a.dwmc zxdjbm,b.dwmc as zxdm,fwlxmc as crm_zxkhxx_fwlxbm,crm_zxkhxx.hfrq as crm_zxkhxx_hfrq,DECODE(crm_zxkhxx.hdbz,'1','�ǻص�','3','ʩ���ӻص�') as crm_zxkhxx_hdbz  ";
	ls_sql+=" FROM crm_zxkhxx,dm_fwlxbm,sq_dwxx a,sq_dwxx b ";
    ls_sql+=" where (crm_zxkhxx.fwlxbm=dm_fwlxbm.fwlxbm(+))";
    ls_sql+=" and crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	ls_sql+=wheresql;
    ls_sql+=" order by crm_zxkhxx.khbh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","InsertYbj_cgsq.jsp","");
	pageObj.setPageRow(1000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("¼��");
	pageObj.setViewBolt("");
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ�ͻ���Ϣ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">�ͻ����</td>
	<td  width="5%">����</td>
	<td  width="17%">���ݵ�ַ</td>
	<td  width="10%">��ϵ��ʽ</td>
	<td  width="5%">���ʦ</td>
	<td  width="5%">ҵ��Ա</td>
	<td  width="6%">��ѯ״̬</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="9%">��ѯ�Ǽǲ���</td>
	<td  width="8%">��ѯ����</td>
	<td  width="7%">��������</td>
	<td  width="7%">�ط�����</td>
	<td  width="6%">�ص���־</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>