<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_cgdd_lrsj=null;
	String jc_jjdd_lrsj=null;
	String xz=null;
	xz=request.getParameter("xz");
	if (xz.equals("C"))
	{
		jc_cgdd_lrsj=request.getParameter("lrsj");
		if (jc_cgdd_lrsj!=null)
		{
			jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
			if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj>=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
		}
		jc_cgdd_lrsj=request.getParameter("lrsj2");
		if (jc_cgdd_lrsj!=null)
		{
			jc_cgdd_lrsj=jc_cgdd_lrsj.trim();
			if (!(jc_cgdd_lrsj.equals("")))	wheresql+="  and (jc_cgdd.lrsj<=TO_DATE('"+jc_cgdd_lrsj+"','YYYY/MM/DD'))";
		}

		ls_sql="SELECT jc_cgdd.ddbh as ddbh,jc_cgdd.jhccsj as jhccsj,jc_cgdd.sccsj as sccsj,jc_cgdd.jhfcsj as jhfcsj,jc_cgdd.sfcsj as sfcsj,jc_cgdd.khbh as khbh,jc_cgdd.dj as jc_cgdd_dj,jc_cgdd.cgsjs as jc_cgdd_cgsjs,clztmc,DECODE(jc_cgdd.khlx,'2','��װ�ͻ�','4','�Ǽ�װ�ͻ�') as jc_cgdd_khlx,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
		ls_sql+=" FROM jc_cgdd,jdm_cgddzt,crm_khxx,sq_dwxx  ";
		ls_sql+=" where jc_cgdd.dwbh=sq_dwxx.dwbh";
		ls_sql+=" and ( jc_cgdd.jhccsj<>jc_cgdd.sccsj or jc_cgdd.jhfcsj<>jc_cgdd.sfcsj) and jc_cgdd.clzt in ('07','11')";
		ls_sql+=" and jc_cgdd.khbh=crm_khxx.khbh(+) and jc_cgdd.clzt=jdm_cgddzt.clzt(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by jc_cgdd.lrsj";
//		out.println(ls_sql);
		pageObj.sql=ls_sql;
		//���ж����ʼ��
			pageObj.initPage("fkCxList.jsp","SelectFkcx.jsp","","");
		//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
		//������ʾ��
		String[] disColName={"ddbh","jc_cgdd_cgsjs","jhccsj","sccsj","jhfcsj","sfcsj","clztmc","khxm","fwdz","hth","jc_cgdd_dj","jc_cgdd_khlx","sq_dwxx_dwmc"};
		pageObj.setDisColName(disColName);

	//��������
		String[] keyName={"ddbh"};
		pageObj.setKey(keyName);
	//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"khbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("jc_cgdd_khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="ViewJc_cgdd.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("ddbh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��


	}
	else
	{
		wheresql="";
		jc_jjdd_lrsj=request.getParameter("lrsj");
		if (jc_jjdd_lrsj!=null)
		{
			jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
			if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj>=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
		}
		jc_jjdd_lrsj=request.getParameter("lrsj2");
		if (jc_jjdd_lrsj!=null)
		{
			jc_jjdd_lrsj=jc_jjdd_lrsj.trim();
			if (!(jc_jjdd_lrsj.equals("")))	wheresql+="  and (jc_jjdd.lrsj<=TO_DATE('"+jc_jjdd_lrsj+"','YYYY/MM/DD'))";
		}

		ls_sql="SELECT jc_jjdd.ddbh as ddbh,jc_jjdd.jhccsj as jhccsj,jc_jjdd.sccsj as sccsj,jc_jjdd.jhfcsj as jhfcsj,jc_jjdd.sfcsj as sfcsj,jc_jjdd.khbh as khbh,jc_jjdd.dj as jc_jjdd_dj,jc_jjdd.jjsjs as jc_jjdd_jjsjs, DECODE(jc_jjdd.kfcbz,'Y','�ɸ���','N','���ɸ���') as jc_jjdd_kfcbz,clztmc, DECODE(jc_jjdd.khlx,'1','װ�޿ͻ�','2','����ͻ�') as jc_jjdd_khlx,crm_khxx.khxm as khxm,crm_khxx.fwdz as fwdz,crm_khxx.hth as hth,sq_dwxx.dwmc as sq_dwxx_dwmc  ";
		ls_sql+=" FROM jc_jjdd,jdm_jjddzt,crm_khxx,sq_dwxx  ";
		ls_sql+=" where jc_jjdd.dwbh=sq_dwxx.dwbh and jc_jjdd.clzt in('00','01')";
		ls_sql+=" and ( jc_jjdd.jhccsj<>jc_jjdd.sccsj or jc_jjdd.jhfcsj<>jc_jjdd.sfcsj)";
		ls_sql+=" and jc_jjdd.clzt=jdm_jjddzt.clzt(+)";
		ls_sql+=" and jc_jjdd.khbh=crm_khxx.khbh(+)";
		ls_sql+=wheresql;
		ls_sql+=" order by jc_jjdd.lrsj";
			pageObj.sql=ls_sql;
		//���ж����ʼ��
			pageObj.initPage("fkCxList.jsp","SelectFkcx.jsp","","");
		//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
		//������ʾ��
		String[] disColName={"ddbh","clztmc","jhccsj","sccsj","jhfcsj","sfcsj","jc_jjdd_clzt","khxm","fwdz","hth","jc_jjdd_dj","jc_jjdd_kfcbz","jc_jjdd_khlx","sq_dwxx_dwmc"};
	    pageObj.setDisColName(disColName);

	//��������
		String[] keyName={"ddbh"};
		pageObj.setKey(keyName);
	//�����г�������
		Hashtable coluParmHash=new Hashtable();
		ColuParm coluParm=null;

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey={"khbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey;//�����в�����coluParm.key������
		coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("khxm",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��

		coluParm=new ColuParm();//����һ���в�������
		String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
		coluParm.key=coluKey1;//�����в�����coluParm.key������
		coluParm.link="ViewJc_jjdd.jsp";//Ϊ�в�����coluParm.link���ó�������
		coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
		coluParmHash.put("ddbh",coluParm);//�в����������Hash��
		pageObj.setColuLink(coluParmHash);//�в����������Hash��
	}
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink();
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">�������</td>
	<td  width="8%">�Ҿ����ʦ</td>
	<td  width="9%">�ƻ�����ʱ��</td>
    <td  width="9%">ʵ�ʳ���ʱ��</td>
	<td  width="9%">�ƻ�����ʱ��</td>
	<td  width="9%">ʵ�ʸ���ʱ��</td>
	<td  width="4%">����״̬</td>
	<td  width="6%">�ͻ�����</td>
	<td  width="22%">���ݵ�ַ</td>
	<td  width="9%">��ͬ��</td>
	<td  width="6%">����</td>
	<td  width="8%">�ͻ�����</td>
	<td  width="11%">¼�벿��</td>
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