<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	String khbh=request.getParameter("khbh");
	String khxm=cf.GB2Uni(request.getParameter("khxm"));
	String khxm2=cf.GB2Uni(request.getParameter("khxm2"));
	String fwdz=cf.GB2Uni(request.getParameter("fwdz"));
	String fwdz2=cf.GB2Uni(request.getParameter("fwdz2"));
	String lxfs=cf.GB2Uni(request.getParameter("lxfs"));
	String lxfs2=cf.GB2Uni(request.getParameter("lxfs2"));

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	String hth=request.getParameter("hth");

	if (!(fgs.equals("")))	wheresql+=" and  (crm_zxkhxx.ssfgs ='"+fgs+"')";
	if (!(dwbh.equals("")))	wheresql+=" and  (crm_zxkhxx.zxdm='"+dwbh+"')";
	if (!(khbh.equals("")))	wheresql+=" and  (crm_zxkhxx.khbh='"+khbh+"')";
	if (!(hth.equals("")))	wheresql+=" and  (crm_zxkhxx.hth='"+hth+"')";
	if (!(khxm.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm='"+khxm+"')";
	if (!(lxfs.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs='"+lxfs+"')";
	if (!(fwdz.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz='"+fwdz+"')";

	if (!(khxm2.equals("")))	wheresql+=" and  (crm_zxkhxx.khxm like '%"+khxm2+"%')";
	if (!(lxfs2.equals("")))	wheresql+=" and  (crm_zxkhxx.lxfs like '%"+lxfs2+"%')";
	if (!(fwdz2.equals("")))	wheresql+=" and  (crm_zxkhxx.fwdz like '%"+fwdz2+"%')";

	ls_sql="SELECT DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','ʧ��','5','�ɵ����δͨ��') as crm_zxkhxx_zxzt,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,b.dwmc as zxdm,sjs, lrsj,a.dwmc zxdjbm,khbh";
	ls_sql+=" FROM crm_zxkhxx,sq_dwxx a,sq_dwxx b ";
	ls_sql+=" where crm_zxkhxx.zxdjbm=a.dwbh(+) and crm_zxkhxx.zxdm=b.dwbh(+) ";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
	ls_sql+=wheresql;
	ls_sql+=" and crm_zxkhxx.zxzt not in('3')";
	ls_sql+=" order by lrsj desc";
//	out.println(ls_sql);
	pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_khxxCxList.jsp","","ZzCw_khfkjl.jsp","");
//	pageObj.setPageRow(40);//����ÿҳ��ʾ��¼��

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setViewStr("ת��");
	pageObj.setViewBolt("");

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link=" /dhzx/dhzx/ViewCrm_zxkhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ���ת��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(100);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="11%">��ѯ״̬</td>
	<td  width="9%">����</td>
	<td  width="26%">���ݵ�ַ</td>
	<td  width="12%">��ѯ����</td>
	<td  width="8%">���ʦ</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="12%">��ѯ�Ǽǲ���</td>
	<td  width="7%">�ͻ����</td>
</tr>
<%
	pageObj.displayDateSum();
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