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
	String fgsbh=null;
	String xqmc=null;
	String khzq=null;
	String dqhd=null;
	String kfjd=null;
	String sjfylx=null;
	String lrr=null;
	String lrsj=null;
	fgsbh=request.getParameter("fgsbh");
	if (fgsbh!=null)
	{
		fgsbh=cf.GB2Uni(fgsbh);
		if (!(fgsbh.equals("")))	wheresql+=" and  (fgsbh='"+fgsbh+"')";
	}
	xqmc=request.getParameter("xqmc");
	if (xqmc!=null)
	{
		xqmc=cf.GB2Uni(xqmc);
		if (!(xqmc.equals("")))	wheresql+=" and  (xqmc='"+xqmc+"')";
	}
	khzq=request.getParameter("khzq");
	if (khzq!=null)
	{
		khzq=cf.GB2Uni(khzq);
		if (!(khzq.equals("")))	wheresql+=" and  (khzq='"+khzq+"')";
	}
	dqhd=request.getParameter("dqhd");
	if (dqhd!=null)
	{
		dqhd=cf.GB2Uni(dqhd);
		if (!(dqhd.equals("")))	wheresql+=" and  (dqhd='"+dqhd+"')";
	}
	kfjd=request.getParameter("kfjd");
	if (kfjd!=null)
	{
		kfjd=cf.GB2Uni(kfjd);
		if (!(kfjd.equals("")))	wheresql+=" and  (kfjd='"+kfjd+"')";
	}
	sjfylx=request.getParameter("sjfylx");
	if (sjfylx!=null)
	{
		sjfylx=cf.GB2Uni(sjfylx);
		if (!(sjfylx.equals("")))	wheresql+=" and  (sjfylx='"+sjfylx+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	ls_sql="SELECT fgsbh,dwmc,xqmc,khzq,yjzczfj,dqsjcz,dqkfhs,pjde,dqhd,xqzyl,jzds1,jzds1zyl,jzds2,jzds2zyl,jzds3,jzds3zyl,kfjd,sjfylx,dqsjfy,lrr,lrsj,yx_xqhdfygl.bz  ";
	ls_sql+=" FROM yx_xqhdfygl,sq_dwxx  ";
    ls_sql+=" where yx_xqhdfygl.fgsbh=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by yx_xqhdfygl.lrsj,yx_xqhdfygl.xqmc,yx_xqhdfygl.khzq";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Yx_xqhdfyglList.jsp","SelectYx_xqhdfygl.jsp","","EditYx_xqhdfygl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
//������ʾ��
	String[] disColName={"dwmc","xqmc","khzq","yjzczfj","dqsjcz","dqkfhs","pjde","dqhd","xqzyl","jzds1","jzds1zyl","jzds2","jzds2zyl","jzds3","jzds3zyl","kfjd","sjfylx","dqsjfy","lrr","lrsj","bz"};
	pageObj.setDisColName(disColName);
/*
*/

//��������
	String[] keyName={"fgsbh","xqmc","khzq"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteYx_xqhdfygl.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xqmc","fgsbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewYx_xqcxhdgl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xqmc",coluParm);//�в����������Hash��
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
	pageObj.printPageLink(260);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="4%">��˾</td>
	<td  width="7%">С������</td>
	<td  width="5%">��������</td>
	<td  width="4%">Ԥ���ܲ�ֵ�ֽ�</td>
	<td  width="4%">����ʵ�ʲ�ֵ</td>
	<td  width="4%">���ڿ�������</td>
	<td  width="4%">ƽ������</td>
	<td  width="5%">���ڻ</td>
	<td  width="4%">С��ռ����</td>
	<td  width="5%">��������1</td>
	<td  width="3%">��������1ռ����</td>
	<td  width="5%">��������2</td>
	<td  width="3%">��������2ռ����</td>
	<td  width="5%">��������3</td>
	<td  width="3%">��������3ռ����</td>
	<td  width="4%">��������</td>
	<td  width="5%">ʵ�ʷ�������</td>
	<td  width="4%">����ʵ�ʷ���</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="12%">��ע</td>
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