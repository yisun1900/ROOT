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
	String jc_khzcgmxx_khbh=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;
	String jc_khzcgmxx_clzt=null;
	String jc_khzcgmxx_lrr=null;
	String jc_khzcgmxx_lrsj=null;
	String jc_khzcgmxx_lrbm=null;
	String jc_khzcgmxx_shr=null;
	String jc_khzcgmxx_shsj=null;
	jc_khzcgmxx_khbh=request.getParameter("jc_khzcgmxx_khbh");
	if (jc_khzcgmxx_khbh!=null)
	{
		jc_khzcgmxx_khbh=cf.GB2Uni(jc_khzcgmxx_khbh);
		if (!(jc_khzcgmxx_khbh.equals("")))	wheresql+=" and  (jc_khzcgmxx.khbh='"+jc_khzcgmxx_khbh+"')";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}
	jc_khzcgmxx_clzt=request.getParameter("jc_khzcgmxx_clzt");
	if (jc_khzcgmxx_clzt!=null)
	{
		jc_khzcgmxx_clzt=cf.GB2Uni(jc_khzcgmxx_clzt);
		if (!(jc_khzcgmxx_clzt.equals("")))	wheresql+=" and  (jc_khzcgmxx.clzt='"+jc_khzcgmxx_clzt+"')";
	}
	jc_khzcgmxx_lrr=request.getParameter("jc_khzcgmxx_lrr");
	if (jc_khzcgmxx_lrr!=null)
	{
		jc_khzcgmxx_lrr=cf.GB2Uni(jc_khzcgmxx_lrr);
		if (!(jc_khzcgmxx_lrr.equals("")))	wheresql+=" and  (jc_khzcgmxx.lrr='"+jc_khzcgmxx_lrr+"')";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj>=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_lrsj=request.getParameter("jc_khzcgmxx_lrsj2");
	if (jc_khzcgmxx_lrsj!=null)
	{
		jc_khzcgmxx_lrsj=jc_khzcgmxx_lrsj.trim();
		if (!(jc_khzcgmxx_lrsj.equals("")))	wheresql+="  and (jc_khzcgmxx.lrsj<=TO_DATE('"+jc_khzcgmxx_lrsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_lrbm=request.getParameter("jc_khzcgmxx_lrbm");
	if (jc_khzcgmxx_lrbm!=null)
	{
		jc_khzcgmxx_lrbm=cf.GB2Uni(jc_khzcgmxx_lrbm);
		if (!(jc_khzcgmxx_lrbm.equals("")))	wheresql+=" and  (jc_khzcgmxx.lrbm='"+jc_khzcgmxx_lrbm+"')";
	}
	jc_khzcgmxx_shr=request.getParameter("jc_khzcgmxx_shr");
	if (jc_khzcgmxx_shr!=null)
	{
		jc_khzcgmxx_shr=cf.GB2Uni(jc_khzcgmxx_shr);
		if (!(jc_khzcgmxx_shr.equals("")))	wheresql+=" and  (jc_khzcgmxx.shr='"+jc_khzcgmxx_shr+"')";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj>=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	jc_khzcgmxx_shsj=request.getParameter("jc_khzcgmxx_shsj2");
	if (jc_khzcgmxx_shsj!=null)
	{
		jc_khzcgmxx_shsj=jc_khzcgmxx_shsj.trim();
		if (!(jc_khzcgmxx_shsj.equals("")))	wheresql+="  and (jc_khzcgmxx.shsj<=TO_DATE('"+jc_khzcgmxx_shsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT jc_khzcgmxx.khbh,crm_khxx.khxm,crm_khxx.fwdz,jc_khzcgmxx.zje, DECODE(jc_khzcgmxx.clzt,'N','δ���','Y','���'),jc_khzcgmxx.lrr,jc_khzcgmxx.lrsj,dwmc,jc_khzcgmxx.shr,jc_khzcgmxx.shsj,jc_khzcgmxx.shyj,jc_khzcgmxx.bz  ";
	ls_sql+=" FROM crm_khxx,jc_khzcgmxx,sq_dwxx  ";
    ls_sql+=" where jc_khzcgmxx.khbh=crm_khxx.khbh(+) and jc_khzcgmxx.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by jc_khzcgmxx.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_khzcgmxxList.jsp","","","EditJc_khzcgmxx.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khbh","crm_khxx_khxm","crm_khxx_fwdz","jc_khzcgmxx_zje","jc_khzcgmxx_clzt","jc_khzcgmxx_lrr","jc_khzcgmxx_lrsj","jc_khzcgmxx_lrbm","jc_khzcgmxx_shr","jc_khzcgmxx_shsj","jc_khzcgmxx_shyj","jc_khzcgmxx_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Jc_khzcgmxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJc_khzcgmxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="ViewJc_khzcgmmx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] khbh = request.getParameterValues("khbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(khbh,"khbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[2];//Ҫִ�е�SQL
		boolean needCommit=true;//����Ҫ������
		sql[0]="delete from jc_khzcgmxx where "+chooseitem;
		sql[1]="delete from jc_khzcgmmx where "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�ͻ����Ĺ�����Ϣ���޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(180);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="4%">�ͻ����</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="15%">���ݵ�ַ</td>
	<td  width="7%">�ܽ��</td>
	<td  width="5%">����״̬</td>
	<td  width="5%">¼����</td>
	<td  width="6%">¼��ʱ��</td>
	<td  width="7%">¼�벿��</td>
	<td  width="5%">�����</td>
	<td  width="7%">���ʱ��</td>
	<td  width="13%">������</td>
	<td  width="15%">��ע</td>
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