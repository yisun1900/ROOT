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
	String cw_sjsjsjl_jsjlh=null;
	String sjsbh=null;
	String cw_sjsjsjl_lrr=null;
	String cw_sjsjsjl_lrsj=null;
	String cw_sjsjsjl_lrbm=null;
	String cw_sjsjsjl_spbz=null;
	String cw_sjsjsjl_spr=null;
	String cw_sjsjsjl_spsj=null;

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_sjsjsjl.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (cw_sjsjsjl.dwbh='"+dwbh+"')";
	}

	cw_sjsjsjl_jsjlh=request.getParameter("cw_sjsjsjl_jsjlh");
	if (cw_sjsjsjl_jsjlh!=null)
	{
		cw_sjsjsjl_jsjlh=cf.GB2Uni(cw_sjsjsjl_jsjlh);
		if (!(cw_sjsjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_sjsjsjl.jsjlh='"+cw_sjsjsjl_jsjlh+"')";
	}
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (cw_sjsjsjl.sjsbh='"+sjsbh+"')";
	}
	cw_sjsjsjl_lrr=request.getParameter("cw_sjsjsjl_lrr");
	if (cw_sjsjsjl_lrr!=null)
	{
		cw_sjsjsjl_lrr=cf.GB2Uni(cw_sjsjsjl_lrr);
		if (!(cw_sjsjsjl_lrr.equals("")))	wheresql+=" and  (cw_sjsjsjl.lrr='"+cw_sjsjsjl_lrr+"')";
	}
	cw_sjsjsjl_lrsj=request.getParameter("cw_sjsjsjl_lrsj");
	if (cw_sjsjsjl_lrsj!=null)
	{
		cw_sjsjsjl_lrsj=cw_sjsjsjl_lrsj.trim();
		if (!(cw_sjsjsjl_lrsj.equals("")))	wheresql+="  and (cw_sjsjsjl.lrsj>=TO_DATE('"+cw_sjsjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_lrsj=request.getParameter("cw_sjsjsjl_lrsj2");
	if (cw_sjsjsjl_lrsj!=null)
	{
		cw_sjsjsjl_lrsj=cw_sjsjsjl_lrsj.trim();
		if (!(cw_sjsjsjl_lrsj.equals("")))	wheresql+="  and (cw_sjsjsjl.lrsj<=TO_DATE('"+cw_sjsjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_lrbm=request.getParameter("cw_sjsjsjl_lrbm");
	if (cw_sjsjsjl_lrbm!=null)
	{
		cw_sjsjsjl_lrbm=cf.GB2Uni(cw_sjsjsjl_lrbm);
		if (!(cw_sjsjsjl_lrbm.equals("")))	wheresql+=" and  (cw_sjsjsjl.lrbm='"+cw_sjsjsjl_lrbm+"')";
	}
	cw_sjsjsjl_spbz=request.getParameter("cw_sjsjsjl_spbz");
	if (cw_sjsjsjl_spbz!=null)
	{
		cw_sjsjsjl_spbz=cf.GB2Uni(cw_sjsjsjl_spbz);
		if (!(cw_sjsjsjl_spbz.equals("")))	wheresql+=" and  (cw_sjsjsjl.spbz='"+cw_sjsjsjl_spbz+"')";
	}
	cw_sjsjsjl_spr=request.getParameter("cw_sjsjsjl_spr");
	if (cw_sjsjsjl_spr!=null)
	{
		cw_sjsjsjl_spr=cf.GB2Uni(cw_sjsjsjl_spr);
		if (!(cw_sjsjsjl_spr.equals("")))	wheresql+=" and  (cw_sjsjsjl.spr='"+cw_sjsjsjl_spr+"')";
	}
	cw_sjsjsjl_spsj=request.getParameter("cw_sjsjsjl_spsj");
	if (cw_sjsjsjl_spsj!=null)
	{
		cw_sjsjsjl_spsj=cw_sjsjsjl_spsj.trim();
		if (!(cw_sjsjsjl_spsj.equals("")))	wheresql+="  and (cw_sjsjsjl.spsj>=TO_DATE('"+cw_sjsjsjl_spsj+"','YYYY/MM/DD'))";
	}
	cw_sjsjsjl_spsj=request.getParameter("cw_sjsjsjl_spsj2");
	if (cw_sjsjsjl_spsj!=null)
	{
		cw_sjsjsjl_spsj=cw_sjsjsjl_spsj.trim();
		if (!(cw_sjsjsjl_spsj.equals("")))	wheresql+="  and (cw_sjsjsjl.spsj<=TO_DATE('"+cw_sjsjsjl_spsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT cw_sjsjsjl.jsjlh,DECODE(cw_sjsjsjl.spbz,'2','δ����','3','����ͨ��','4','����δͨ��'),b.dwmc dwbh,c.dwmc sjsbh,cw_sjsjsjl.sjfw2,cw_sjsjsjl.dyqdze,cw_sjsjsjl.dyqds,cw_sjsjsjl.sjstcbl||'%',cw_sjsjsjl.sjsjsbl||'%',cw_sjsjsjl.dyjss,cw_sjsjsjl.jzssk,cw_sjsjsjl.wgjsje,cw_sjsjsjl.kqtk,cw_sjsjsjl.qdsyjsje,cw_sjsjsjl.sjf,cw_sjsjsjl.sjfksbl||'%',cw_sjsjsjl.sjftcbl||'%',cw_sjsjsjl.dyjsze,cw_sjsjsjl.lrr,cw_sjsjsjl.lrsj,a.dwmc lrbm, cw_sjsjsjl.spyj,cw_sjsjsjl.spr,cw_sjsjsjl.spsj,cw_sjsjsjl.bz  ";
	ls_sql+=" FROM cw_sjsjsjl,sq_dwxx a,sq_dwxx b,sq_dwxx c  ";
    ls_sql+=" where cw_sjsjsjl.lrbm=a.dwbh and cw_sjsjsjl.dwbh=b.dwbh and cw_sjsjsjl.sjsbh=c.dwbh";
    ls_sql+=" and cw_sjsjsjl.spbz in('3','4')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_sjsjsjl.jsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_sjsjsjlXgSpList.jsp","SelectXgSpCw_sjsjsjl.jsp","","XgSpCw_sjsjsjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_sjsjsjl_dwbh","cw_sjsjsjl_sjsbh","cw_sjsjsjl_sjfw2","cw_sjsjsjl_dyqdze","cw_sjsjsjl_dyqds","cw_sjsjsjl_sjstcbl","cw_sjsjsjl_sjsjsbl","cw_sjsjsjl_dyjss","cw_sjsjsjl_jzssk","cw_sjsjsjl_wgjsje","cw_sjsjsjl_kqtk","cw_sjsjsjl_qdsyjsje","cw_sjsjsjl_sjf","cw_sjsjsjl_sjfksbl","cw_sjsjsjl_sjftcbl","cw_sjsjsjl_dyjsze","cw_sjsjsjl_lrr","cw_sjsjsjl_lrsj","sq_dwxx_dwmc","cw_sjsjsjl_spbz","cw_sjsjsjl_spyj","cw_sjsjsjl_spr","cw_sjsjsjl_spsj","cw_sjsjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpCw_sjsjsjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_sjsjsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">���ʦ����---�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�����¼��</td>
	<td  width="3%">������־</td>
	<td  width="5%">����</td>
	<td  width="5%">�����</td>
	<td  width="4%">ʱ�䷶Χ��</td>
	<td  width="4%">����ǩ���ܶ�</td>
	<td  width="3%">����ǩ����</td>
	<td  width="3%">���ʦ��ɱ���</td>
	<td  width="3%">���ʦ�������</td>
	<td  width="3%">�깤������</td>
	<td  width="4%">��װʵ�տ�</td>
	<td  width="4%">�깤������</td>
	<td  width="3%">��������</td>
	<td  width="4%">ǩ��ʱ�ѽ�����</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">��Ʒѿ�˰����</td>
	<td  width="3%">��Ʒ���ɱ���</td>
	<td  width="4%">���ʦ�����ܶ�</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">��λ����</td>
	<td  width="7%">�������</td>
	<td  width="3%">������</td>
	<td  width="4%">����ʱ��</td>
	<td  width="7%">��ע</td>
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