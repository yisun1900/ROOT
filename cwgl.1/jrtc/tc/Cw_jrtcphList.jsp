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
	String cw_jrtcph_khzq=null;
	String cw_jrtcph_ssfgs=null;
	String cw_jrtcph_clzt=null;
	String cw_jrtcph_spr=null;
	String cw_jrtcph_spsj=null;
	String cw_jrtcph_spyj=null;
	String cw_jrtcph_lrsj=null;
	cw_jrtcph_khzq=request.getParameter("cw_jrtcph_khzq");
	if (cw_jrtcph_khzq!=null)
	{
		cw_jrtcph_khzq=cf.GB2Uni(cw_jrtcph_khzq);
		if (!(cw_jrtcph_khzq.equals("")))	wheresql+=" and  (cw_jrtcph.khzq='"+cw_jrtcph_khzq+"')";
	}
	cw_jrtcph_ssfgs=request.getParameter("cw_jrtcph_ssfgs");
	if (cw_jrtcph_ssfgs!=null)
	{
		cw_jrtcph_ssfgs=cf.GB2Uni(cw_jrtcph_ssfgs);
		if (!(cw_jrtcph_ssfgs.equals("")))	wheresql+=" and  (cw_jrtcph.ssfgs='"+cw_jrtcph_ssfgs+"')";
	}
	cw_jrtcph_clzt=request.getParameter("cw_jrtcph_clzt");
	if (cw_jrtcph_clzt!=null)
	{
		cw_jrtcph_clzt=cf.GB2Uni(cw_jrtcph_clzt);
		if (!(cw_jrtcph_clzt.equals("")))	wheresql+=" and  (cw_jrtcph.clzt='"+cw_jrtcph_clzt+"')";
	}
	cw_jrtcph_spr=request.getParameter("cw_jrtcph_spr");
	if (cw_jrtcph_spr!=null)
	{
		cw_jrtcph_spr=cf.GB2Uni(cw_jrtcph_spr);
		if (!(cw_jrtcph_spr.equals("")))	wheresql+=" and  (cw_jrtcph.spr='"+cw_jrtcph_spr+"')";
	}
	cw_jrtcph_spsj=request.getParameter("cw_jrtcph_spsj");
	if (cw_jrtcph_spsj!=null)
	{
		cw_jrtcph_spsj=cw_jrtcph_spsj.trim();
		if (!(cw_jrtcph_spsj.equals("")))	wheresql+="  and (cw_jrtcph.spsj>=TO_DATE('"+cw_jrtcph_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_spsj=request.getParameter("cw_jrtcph_spsj2");
	if (cw_jrtcph_spsj!=null)
	{
		cw_jrtcph_spsj=cw_jrtcph_spsj.trim();
		if (!(cw_jrtcph_spsj.equals("")))	wheresql+="  and (cw_jrtcph.spsj<=TO_DATE('"+cw_jrtcph_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_spyj=request.getParameter("cw_jrtcph_spyj");
	if (cw_jrtcph_spyj!=null)
	{
		cw_jrtcph_spyj=cf.GB2Uni(cw_jrtcph_spyj);
		if (!(cw_jrtcph_spyj.equals("")))	wheresql+=" and  (cw_jrtcph.spyj='"+cw_jrtcph_spyj+"')";
	}
	cw_jrtcph_lrsj=request.getParameter("cw_jrtcph_lrsj");
	if (cw_jrtcph_lrsj!=null)
	{
		cw_jrtcph_lrsj=cw_jrtcph_lrsj.trim();
		if (!(cw_jrtcph_lrsj.equals("")))	wheresql+="  and (cw_jrtcph.lrsj>=TO_DATE('"+cw_jrtcph_lrsj+"','YYYY/MM/DD'))";
	}
	cw_jrtcph_lrsj=request.getParameter("cw_jrtcph_lrsj2");
	if (cw_jrtcph_lrsj!=null)
	{
		cw_jrtcph_lrsj=cw_jrtcph_lrsj.trim();
		if (!(cw_jrtcph_lrsj.equals("")))	wheresql+="  and (cw_jrtcph.lrsj<=TO_DATE('"+cw_jrtcph_lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_jrtcph.khzq,cw_jrtcph.ssfgs,a.dwmc fgsmc,cw_jrtcph.tcqssj,cw_jrtcph.tcjzsj,cw_jrtcph.tcdsl,cw_jrtcph.zxktcze,cw_jrtcph.sjftcze, DECODE(cw_jrtcph.clzt,'1','����','2','����ͬ��','3','������ͬ��'),cw_jrtcph.spr,cw_jrtcph.spsj,cw_jrtcph.spyj,cw_jrtcph.lrr,cw_jrtcph.lrsj,b.dwmc lrbm,cw_jrtcph.bz  ";
	ls_sql+=" FROM cw_jrtcph,sq_dwxx a,sq_dwxx b  ";
    ls_sql+=" where cw_jrtcph.ssfgs=a.dwbh(+)";
    ls_sql+=" and cw_jrtcph.lrbm=b.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrtcph.ssfgs,cw_jrtcph.khzq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrtcphList.jsp","","","EditCw_jrtcph.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"khzq","ssfgs","sq_dwxx_dwmc","cw_jrtcph_tcqssj","cw_jrtcph_tcjzsj","cw_jrtcph_tcdsl","cw_jrtcph_zxktcze","cw_jrtcph_sjftcze","cw_jrtcph_clzt","cw_jrtcph_spr","cw_jrtcph_spsj","cw_jrtcph_spyj","cw_jrtcph_lrr","cw_jrtcph_lrsj","cw_jrtcph_lrbm","cw_jrtcph_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khzq","ssfgs"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_jrtcph.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khzq","ssfgs"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_jrtcph.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khzq",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">��������</td>
	<td  width="4%">�ֹ�˾</td>
	<td  width="7%">�ֹ�˾</td>
	<td  width="5%">���������ʼʱ��</td>
	<td  width="5%">������ɽ���ʱ��</td>
	<td  width="4%">��ɵ�����</td>
	<td  width="5%">װ�޿�����ܶ�</td>
	<td  width="5%">��Ʒ�����ܶ�</td>
	<td  width="4%">����״̬</td>
	<td  width="3%">������</td>
	<td  width="5%">����ʱ��</td>
	<td  width="15%">�������</td>
	<td  width="3%">¼����</td>
	<td  width="5%">¼��ʱ��</td>
	<td  width="6%">¼�벿��</td>
	<td  width="14%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
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