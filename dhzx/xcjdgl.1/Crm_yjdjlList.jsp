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
	String crm_yjdjl_jdjlh=null;
	String crm_yjdjl_sqrq=null;
	String crm_yjdjl_sqr=null;
	String crm_yjdjl_sqrlxdh=null;
	String crm_yjdjl_jhjdrq=null;

	String crm_yjdjl_clzt=null;
	String crm_yjdjl_lrr=null;
	String crm_yjdjl_lrsj=null;

	crm_yjdjl_jdjlh=request.getParameter("crm_yjdjl_jdjlh");
	if (crm_yjdjl_jdjlh!=null)
	{
		crm_yjdjl_jdjlh=cf.GB2Uni(crm_yjdjl_jdjlh);
		if (!(crm_yjdjl_jdjlh.equals("")))	wheresql+=" and  (crm_yjdjl.jdjlh='"+crm_yjdjl_jdjlh+"')";
	}
	crm_yjdjl_sqrq=request.getParameter("crm_yjdjl_sqrq");
	if (crm_yjdjl_sqrq!=null)
	{
		crm_yjdjl_sqrq=crm_yjdjl_sqrq.trim();
		if (!(crm_yjdjl_sqrq.equals("")))	wheresql+="  and (crm_yjdjl.sqrq>=TO_DATE('"+crm_yjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_sqrq=request.getParameter("crm_yjdjl_sqrq2");
	if (crm_yjdjl_sqrq!=null)
	{
		crm_yjdjl_sqrq=crm_yjdjl_sqrq.trim();
		if (!(crm_yjdjl_sqrq.equals("")))	wheresql+="  and (crm_yjdjl.sqrq<=TO_DATE('"+crm_yjdjl_sqrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_sqr=request.getParameter("crm_yjdjl_sqr");
	if (crm_yjdjl_sqr!=null)
	{
		crm_yjdjl_sqr=cf.GB2Uni(crm_yjdjl_sqr);
		if (!(crm_yjdjl_sqr.equals("")))	wheresql+=" and  (crm_yjdjl.sqr='"+crm_yjdjl_sqr+"')";
	}
	crm_yjdjl_sqrlxdh=request.getParameter("crm_yjdjl_sqrlxdh");
	if (crm_yjdjl_sqrlxdh!=null)
	{
		crm_yjdjl_sqrlxdh=cf.GB2Uni(crm_yjdjl_sqrlxdh);
		if (!(crm_yjdjl_sqrlxdh.equals("")))	wheresql+=" and  (crm_yjdjl.sqrlxdh='"+crm_yjdjl_sqrlxdh+"')";
	}
	crm_yjdjl_jhjdrq=request.getParameter("crm_yjdjl_jhjdrq");
	if (crm_yjdjl_jhjdrq!=null)
	{
		crm_yjdjl_jhjdrq=crm_yjdjl_jhjdrq.trim();
		if (!(crm_yjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_yjdjl.jhjdrq>=TO_DATE('"+crm_yjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_jhjdrq=request.getParameter("crm_yjdjl_jhjdrq2");
	if (crm_yjdjl_jhjdrq!=null)
	{
		crm_yjdjl_jhjdrq=crm_yjdjl_jhjdrq.trim();
		if (!(crm_yjdjl_jhjdrq.equals("")))	wheresql+="  and (crm_yjdjl.jhjdrq<=TO_DATE('"+crm_yjdjl_jhjdrq+"','YYYY/MM/DD'))";
	}

	crm_yjdjl_clzt=request.getParameter("crm_yjdjl_clzt");
	if (crm_yjdjl_clzt!=null)
	{
		crm_yjdjl_clzt=cf.GB2Uni(crm_yjdjl_clzt);
		if (!(crm_yjdjl_clzt.equals("")))	wheresql+=" and  (crm_yjdjl.clzt='"+crm_yjdjl_clzt+"')";
	}
	crm_yjdjl_lrr=request.getParameter("crm_yjdjl_lrr");
	if (crm_yjdjl_lrr!=null)
	{
		crm_yjdjl_lrr=cf.GB2Uni(crm_yjdjl_lrr);
		if (!(crm_yjdjl_lrr.equals("")))	wheresql+=" and  (crm_yjdjl.lrr='"+crm_yjdjl_lrr+"')";
	}
	crm_yjdjl_lrsj=request.getParameter("crm_yjdjl_lrsj");
	if (crm_yjdjl_lrsj!=null)
	{
		crm_yjdjl_lrsj=crm_yjdjl_lrsj.trim();
		if (!(crm_yjdjl_lrsj.equals("")))	wheresql+="  and (crm_yjdjl.lrsj>=TO_DATE('"+crm_yjdjl_lrsj+"','YYYY/MM/DD'))";
	}
	crm_yjdjl_lrsj=request.getParameter("crm_yjdjl_lrsj2");
	if (crm_yjdjl_lrsj!=null)
	{
		crm_yjdjl_lrsj=crm_yjdjl_lrsj.trim();
		if (!(crm_yjdjl_lrsj.equals("")))	wheresql+="  and (crm_yjdjl.lrsj<=TO_DATE('"+crm_yjdjl_lrsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_yjdjl.jdjlh, DECODE(crm_yjdjl.clzt,'1','����','2','�ɵ�','3','��Ԥ����'),crm_yjdjl.khbh,crm_zxkhxx.khxm,crm_zxkhxx.fwdz,crm_zxkhxx.hth,crm_zxkhxx.sjs,dwmc,crm_yjdjl.sqrq,crm_yjdjl.sqr,crm_yjdjl.sqrlxdh,crm_yjdjl.jhjdrq,crm_yjdjl.jhjdsj,crm_yjdjl.sqsm,crm_yjdjl.lrr,crm_yjdjl.lrsj";
	ls_sql+=" FROM crm_zxkhxx,crm_yjdjl,sq_dwxx  ";
    ls_sql+=" where crm_yjdjl.khbh=crm_zxkhxx.khbh and crm_zxkhxx.zxdm=sq_dwxx.dwbh";
    ls_sql+=" and crm_zxkhxx.xcjdbz='2'";
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_zxkhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_zxkhxx.zxdm in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_yjdjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_yjdjlList.jsp","","","EditCrm_yjdjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jdjlh","crm_yjdjl_khbh","crm_zxkhxx_khxm","crm_zxkhxx_fwdz","crm_zxkhxx_hth","crm_zxkhxx_sjs","crm_yjdjl_sqrq","crm_yjdjl_sqr","crm_yjdjl_sqrlxdh","crm_yjdjl_sfxtp","crm_yjdjl_jhjdrq","crm_yjdjl_jhjdsj","crm_yjdjl_sqsm","crm_yjdjl_zcwcsj","crm_yjdjl_jdqrwcsj","crm_yjdjl_fbr","crm_yjdjl_fbsj","crm_yjdjl_zzqrjdrq","crm_yjdjl_zzqrjdsj","crm_yjdjl_sjjdsj","crm_yjdjl_jdsfcg","crm_yjdjl_sfkkg","crm_yjdjl_tzsfqr","crm_yjdjl_fasfkx","crm_yjdjl_khsfqr","crm_yjdjl_xcfzrqr","crm_yjdjl_qtczdqr","crm_yjdjl_clzt","crm_yjdjl_lrr","crm_yjdjl_lrsj","crm_yjdjl_lrbm","crm_yjdjl_sbsfcl","crm_yjdjl_tpshr","crm_yjdjl_tpshsj","crm_yjdjl_tpsftg","crm_yjdjl_tpsm"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jdjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_yjdjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jdjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCrm_yjdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jdjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
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
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">Ԥ��������ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">Ԥ���׼�¼��</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">�ͻ����</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="5%">��ͬ��</td>
	<td  width="4%">���ʦ</td>
	<td  width="6%">����</td>
	<td  width="4%">��������</td>
	<td  width="3%">������</td>
	<td  width="11%">��������ϵ�绰</td>
	<td  width="4%">�ƻ�Ԥ��������</td>
	<td  width="3%">�ƻ�Ԥ����ʱ��</td>
	<td  width="24%">����˵��</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
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