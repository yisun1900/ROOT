<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>


<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";


	String clzt=null;
	clzt=request.getParameter("clzt");
	if (clzt!=null)
	{
		clzt=cf.GB2Uni(clzt);
		if (!(clzt.equals("")))	wheresql+=" and  (crm_tsjl.clzt='"+clzt+"')";
	}

	String sfja=null;
	sfja=request.getParameter("sfja");
	if (sfja!=null)
	{
		sfja=cf.GB2Uni(sfja);
		if (sfja.equals("Y"))
		{
			wheresql+=" and  (crm_tsjl.clzt in('3'))";
		}
		else if (sfja.equals("N"))
		{
			wheresql+=" and  (crm_tsjl.clzt in('1','4','5','6','7','2'))";
		}
	}


	String zrbmclzt=null;
	zrbmclzt=request.getParameter("zrbmclzt");
	if (zrbmclzt!=null)
	{
		zrbmclzt=cf.GB2Uni(zrbmclzt);
		if (!(zrbmclzt.equals("")))	wheresql+=" and  (crm_tsbm.clzt='"+zrbmclzt+"')";
	}


	String sfjj=null;
	sfjj=request.getParameter("sfjj");
	if (sfjj!=null)
	{
		sfjj=cf.GB2Uni(sfjj);
		if (sfjj.equals("Y"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('3','5'))";
		}
		else if (sfjj.equals("N"))
		{
			wheresql+=" and  (crm_tsbm.clzt in('1','2','4','6','7','8','9','A','B','C'))";
		}
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}
	String sgbz=null;
	sgbz=request.getParameter("sgbz");
	if (sgbz!=null)
	{
		sgbz=cf.GB2Uni(sgbz);
		if (!(sgbz.equals("")))	wheresql+=" and  (crm_khxx.sgbz='"+sgbz+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}


	String crm_tsbm_tsxlbm=null;
	String crm_tsbm_tslxbm=null;
	crm_tsbm_tslxbm=request.getParameter("crm_tsbm_tslxbm");
	if (crm_tsbm_tslxbm!=null)
	{
		crm_tsbm_tslxbm=cf.GB2Uni(crm_tsbm_tslxbm);
		if (!(crm_tsbm_tslxbm.equals("")))	wheresql+=" and  (crm_tsbm.tslxbm='"+crm_tsbm_tslxbm+"')";
	}
	crm_tsbm_tsxlbm=request.getParameter("crm_tsbm_tsxlbm");
	if (crm_tsbm_tsxlbm!=null)
	{
		crm_tsbm_tsxlbm=cf.GB2Uni(crm_tsbm_tsxlbm);
		if (!(crm_tsbm_tsxlbm.equals("")))	wheresql+=" and  (crm_tsbm.tsxlbm='"+crm_tsbm_tsxlbm+"')";
	}


	String crm_tsbm_tspp=null;
	crm_tsbm_tspp=request.getParameter("crm_tsbm_tspp");
	if (crm_tsbm_tspp!=null)
	{
		crm_tsbm_tspp=cf.GB2Uni(crm_tsbm_tspp);
		if (!(crm_tsbm_tspp.equals("")))	wheresql+=" and  (crm_tsbm.tspp='"+crm_tsbm_tspp+"')";
	}

	String crm_tsbm_tspp2=null;
	crm_tsbm_tspp2=request.getParameter("crm_tsbm_tspp2");
	if (crm_tsbm_tspp2!=null)
	{
		crm_tsbm_tspp2=cf.GB2Uni(crm_tsbm_tspp2);
		if (!(crm_tsbm_tspp2.equals("")))	wheresql+=" and  (crm_tsbm.tspp like '%"+crm_tsbm_tspp2+"%')";
	}

	String slsj=null;
	String slsj2=null;
	slsj=request.getParameter("slsj");
	if (slsj!=null)
	{
		if (!(slsj.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+slsj+"','YYYY/MM/DD'))";
	}
	slsj2=request.getParameter("slsj2");
	if (slsj2!=null)
	{
		if (!(slsj2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+slsj2+"','YYYY/MM/DD'))";
	}
	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		if (!(lrsj.equals("")))	wheresql+="  and (crm_tsjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}



	String fgs=request.getParameter("fgs");
	if (fgs!=null)
	{
		if (!fgs.equals(""))
		{
			wheresql+=" and  (crm_tsbm.ssfgs='"+fgs+"')";
		}
	}

	String dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!dwbh.equals(""))
		{
			wheresql+=" and  (crm_tsbm.dwbh='"+dwbh+"')";
		}
	}

	String sjcfasj=null;
	sjcfasj=request.getParameter("sjcfasj");
	if (sjcfasj!=null)
	{
		sjcfasj=cf.GB2Uni(sjcfasj);
		if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj>=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
	}
	sjcfasj=request.getParameter("sjcfasj2");
	if (sjcfasj!=null)
	{
		sjcfasj=cf.GB2Uni(sjcfasj);
		if (!(sjcfasj.equals("")))	wheresql+="  and (crm_tsbm.sjcfasj<=TO_DATE('"+sjcfasj+"','YYYY/MM/DD'))";
	}

	String jhjjsj=null;
	jhjjsj=request.getParameter("jhjjsj");
	if (jhjjsj!=null)
	{
		jhjjsj=cf.GB2Uni(jhjjsj);
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj>=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jhjjsj=request.getParameter("jhjjsj2");
	if (jhjjsj!=null)
	{
		jhjjsj=cf.GB2Uni(jhjjsj);
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_tsbm.jhjjsj<=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}

	String clsj=null;
	clsj=request.getParameter("clsj");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj>=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}
	clsj=request.getParameter("clsj2");
	if (clsj!=null)
	{
		clsj=cf.GB2Uni(clsj);
		if (!(clsj.equals("")))	wheresql+="  and (crm_tsbm.clsj<=TO_DATE('"+clsj+"','YYYY/MM/DD'))";
	}

	String tsjlh=null;
	tsjlh=request.getParameter("tsjlh");
	if (tsjlh!=null)
	{
		tsjlh=cf.GB2Uni(tsjlh);
		if (!(tsjlh.equals("")))	wheresql+="  and (crm_tsbm.tsjlh='"+tsjlh+"')";
	}
	
	
	ls_sql="SELECT  crm_tsjl.tsjlh,crm_tsbm.zrr,crm_tsjl.khbh,tsxlmc,dm_slfsbm.slfsmc,crm_khxx.khxm,crm_khxx.fwdz";
	ls_sql+=" ,crm_tsjl.slsj,crm_tsbm.dwbh,sq_dwxx.dwmc zrbm,crm_tsbm.tzsj,crm_tsbm.tsyybm,crm_tsbm.tspp";
	ls_sql+=" ,DECODE(crm_tsbm.clzt,'1','δ����','2','�ѽ��յȴ�������','D','�ѽ��ղ��������','E','����ʵ','4','�ѽ��յȴ����ֳ�','6','�ѳ��ֳ��ȴ�������','7','�ѳ������ȴ����','8','�ѳ������������','9','�������ͨ��','A','�������δͨ��','3','�ѽ��','C','�ط�δ���','B','�ڴ���','5','�᰸') as clzt,crm_khxx.sjs";
	ls_sql+=" ,DECODE(crm_tsjl.clzt,'0','δ����','1','������','4','�ѽ���','5','�ѳ��ֳ�','6','�ѳ�����','7','�������ͨ��','2','�ڴ���','3','�᰸','9','������') as jazt,sgdmc";

	ls_sql+=" ,crm_tsbm.jssj,crm_tsbm.jsr,crm_tsbm.jssm";
	ls_sql+=" ,crm_tsbm.jhcxcsj,crm_tsbm.kcjlh,crm_tsbm.sjcxcr,crm_tsbm.sjcxcsj,crm_tsbm.cxcsm";
	ls_sql+=" ,crm_tsbm.jhcfasj,crm_tsbm.cfajlh,crm_tsbm.sjcfar,crm_tsbm.sjcfasj,crm_tsbm.jjfa";
	ls_sql+=" ,crm_tsbm.jhjjsj,DECODE(crm_tsbm.sfpfkh,'1','��','2','�⸶') sfpfkh,crm_tsbm.khpfze,DECODE(crm_tsbm.sfnbcf,'1','��','2','����') sfnbcf,crm_tsbm.nbcfze";
	ls_sql+=" ,crm_tsbm.shbm,crm_tsbm.shr,crm_tsbm.shsj,crm_tsbm.shsm";
	ls_sql+=" ,crm_tsbm.cljlh,crm_tsbm.sjjjsj,crm_tsbm.clr,crm_tsbm.clsj,crm_tsbm.clqk";
	ls_sql+=" ,dm_tshfjgbm.hfjgmc,crm_tsbm.qrjjsj,DECODE(crm_tsbm.sfjslx,'Y','��ʱ��ϵ','N','δ��ʱ��ϵ','W','���δ֪') sfjslx,dm_zzjgbm.zzjgmc,dm_jsxbm.jsxmc";



	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,dm_tsxlbm,crm_tsbm,sq_dwxx,sq_sgd,dm_tshfjgbm,dm_zzjgbm,dm_jsxbm ";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+)";
    ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=sq_dwxx.dwbh(+)  ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsbm.hfjgbm=dm_tshfjgbm.hfjgbm(+) ";
    ls_sql+=" and crm_tsbm.zzjgbm=dm_zzjgbm.zzjgbm(+) ";
    ls_sql+=" and crm_tsbm.jsxbm=dm_jsxbm.jsxbm(+) ";
	ls_sql+=" and crm_tsjl.lx='2'";//1��Ͷ�ߣ�2������

	ls_sql+=wheresql;
    ls_sql+=" order by crm_tsbm.jssj desc,crm_tsbm.cljlh,crm_tsbm.tsyybm" ;
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_tsbmCxList.jsp","","","");
//	pageObj.setPageRow(2);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"tsjlh","zrbm","zrr","tsxlmc","clzt","khxm","fwdz","jssj","jsr","jssm","jhcxcsj","kcjlh","sjcxcsj","sjcxcr","cxcsm","jhcfasj","cfajlh","sjcfasj","sjcfar","jjfa","jhjjsj","sfpfkh","khpfze","sfnbcf","nbcfze","shbm","shr","shsj","shsm","cljlh","sjjjsj","clsj","clr","clqk","hfjgmc","qrjjsj","sfjslx","zzjgmc","jsxmc","sjs","sgdmc","slfsmc","slsj","jazt","tspp"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"tsjlh","tsyybm"};
	pageObj.setKey(keyName);
//	pageObj.setEditStr("����"); 




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
	String[] coluKey1={"tsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("tsjlh",coluParm);//�в����������Hash��
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
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>��ѯͶ��</B> 
</CENTER>

<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(630);
%>

<tr bgcolor="#CCCCCC"  align="center">
	<td  width="70px">Ͷ�����</td>
	<td  width="2%">���β���</td>
	<td  width="1%">������</td>
	<td  width="3%">Ͷ��ԭ��</td>
	<td  width="2%">����״̬</td>
	<td  width="1%">����</td>
	<td  width="5%">���ݵ�ַ</td>

	<td  width="80px">����ʱ��</td>
	<td  width="1%">������</td>
	<td  width="6%">����˵��</td>

	<td  width="80px">�ƻ����ֳ�ʱ��</td>
	<td  width="80px">���ֳ���¼��</td>
	<td  width="80px">ʵ�ʳ��ֳ�ʱ��</td>
	<td  width="1%">ʵ�ʳ��ֳ���</td>
	<td  width="7%">���ֳ�˵��</td>

	<td  width="80px">�ƻ�������ʱ��</td>
	<td  width="80px">��������¼��</td>
	<td  width="80px">ʵ�ʳ�����ʱ��</td>
	<td  width="1%">ʵ�ʳ�������</td>
	<td  width="8%">�������</td>

	<td  width="80px">�ƻ����ʱ��</td>
	<td  width="1%">�Ƿ��⸶�ͻ�</td>
	<td  width="1%">�ͻ��⸶�ܶ�</td>
	<td  width="1%">�Ƿ��ڲ�����</td>
	<td  width="1%">�ڲ������ܶ�</td>

	<td  width="2%">������˲���</td>
	<td  width="1%">���������</td>
	<td  width="80px">�������ʱ��</td>
	<td  width="6%">�������˵��</td>

	<td  width="80px">������¼��</td>
	<td  width="80px">ʵ�ʽ��ʱ��</td>
	<td  width="80px">���´���ʱ��</td>
	<td  width="1%">���´�����</td>
	<td  width="9%">���´������</td>

	<td  width="2%">�ͷ��طý������</td>
	<td  width="80px">ȷ�Ͻ��ʱ��</td>
	<td  width="2%">�Ƿ�ʱ��ϵ</td>
	<td  width="2%">�᰸�ͻ��Ƿ�����</td>
	<td  width="2%">������⼰ʱ��</td>



	<td  width="1%">���ʦ</td>
	<td  width="1%">ʩ����</td>
	<td  width="1%">Ͷ����Դ</td>
	<td  width="80px">����ʱ��</td>
	<td  width="2%">�᰸״̬</td>
	<td  width="3%">�漰����</td>
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